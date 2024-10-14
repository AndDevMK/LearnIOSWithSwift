//
//  WKWebViewViewController.swift
//  UseUIWebViewAndWKWebView
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

// 引入WebKit框架
import WebKit

class WKWebViewViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
    /*
         当JavaScript代码向WebKit中注册的交互方法发送消息后，系统会调用这个协议方法。
     */
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // WKScriptMessage封装了传递的消息内容
        switch message.name {
        case "jsCallNative":
            if let result = message.body as? [String: Any] {
                for (key, value) in result {
                    print("\(key), \(value)")
                }
            }
        default:
            print("无法匹配方法名称")
        }
    }

    var wkWebView: WKWebView?
    var buttonGoBack, buttonGoForward: UIButton?
    var progressView: UIProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 顶部工具栏
        let toolBar = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        // 后退按钮
        self.buttonGoBack = UIButton(type: .system)
        self.buttonGoBack?.frame = CGRect(x: 20, y: 5, width: toolBar.frame.width / 2 - 20 - 10, height: 40)
        self.buttonGoBack?.setTitle("后退", for: .normal)
        self.buttonGoBack?.setTitleColor(UIColor.white, for: .normal)
        self.buttonGoBack?.backgroundColor = UIColor.systemBlue
        self.buttonGoBack?.addTarget(self, action: #selector(self.onWebViewGoBack), for: .touchUpInside)
        toolBar.addSubview(self.buttonGoBack!)
        // 前进按钮
        self.buttonGoForward = UIButton(type: .system)
        self.buttonGoForward?.frame = CGRect(x: 20 + (toolBar.frame.width / 2 - 20 - 10) + 20, y: 5, width: toolBar.frame.width / 2 - 20 - 10, height: 40)
        self.buttonGoForward?.setTitle("前进", for: .normal)
        self.buttonGoForward?.setTitleColor(UIColor.white, for: .normal)
        self.buttonGoForward?.backgroundColor = UIColor.systemBlue
        self.buttonGoForward?.addTarget(self, action: #selector(self.onWebViewGoForward), for: .touchUpInside)
        toolBar.addSubview(self.buttonGoForward!)
        self.view.addSubview(toolBar)

        // 加载进度条
        self.progressView = UIProgressView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 2))
        self.progressView?.trackTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.02)
        self.progressView?.progressTintColor = UIColor.systemBlue
        self.progressView?.progress = 0
        self.view.addSubview(self.progressView!)

        // 网页配置
        let webViewConfiguration = WKWebViewConfiguration()
        /*
           开发者一般不需要对进程池进行配置，配置为同一进程池中的WKWebView实例会共享一些资源，进程池在需要使用多个WKWebView实例时会使用到。
         */
        let processPool = WKProcessPool()
        webViewConfiguration.processPool = processPool
        /*
           偏好设置
         */
        let preferences = WKPreferences()
        // 网页最小字号，默认为0
        preferences.minimumFontSize = 0
        // 支持js脚本
        preferences.javaScriptEnabled = true
        // 允许不经过用户交互，由js代码自动打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = true
        webViewConfiguration.preferences = preferences
        /*
           js交互
         */
        let userContentController = WKUserContentController()
        // 设置代理并注册要被js代码调用的原生方法名称
        userContentController.add(self, name: "jsCallNative")
        // 向网页注入js代码
        let jsCodeStr = """
        function getUserInfo(){
            window.webkit.messageHandlers.jsCallNative.postMessage({\"name\": \"MinKin\", \"age\": 29})
        }
        getUserInfo()
        // iOS调js
        function getStrLen(str){
            return str.length
        }
        """
        // js调iOS
        // injectionTime：设置注入的时机。此处为在文档首部进行注入。forMainFrameOnly：是否只在主界面注入
        userContentController.addUserScript(WKUserScript(source: jsCodeStr, injectionTime: .atDocumentStart, forMainFrameOnly: false))
        webViewConfiguration.userContentController = userContentController

        // 创建WKWebView实例
        self.wkWebView = WKWebView(frame: CGRect(x: 0, y: 50 + 2, width: self.view.frame.width, height: self.view.frame.height - 50), configuration: webViewConfiguration)
        // 处理JavaScript与原生代码交互的一个重要协议，其中主要定义了一些与网页警告框有关的回调方法
        self.wkWebView?.uiDelegate = self
        // 处理加载状态回调
        self.wkWebView?.navigationDelegate = self
        self.view.addSubview(self.wkWebView!)
        // 加载网页
        self.wkWebView?.load(URLRequest(url: URL(string: "https://news.qq.com")!))

        /*
            对WKWebView实例的属性estimatedProgress监听
         */
        self.wkWebView?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }

    /*
        NSObject的扩展方法：这里对WKWebView实例的属性estimatedProgress监听

        KVO（Key-Value-Observe，键值监听）是iOS开发中一种常用的属性监听技术，其通过设置监听者
        来监听某个类的某个属性，当属性值发生改变时就会通知监听者，在回调的通知方法中，开发者可以获取到所监听的属性值的相关信息。
     */
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey: Any]?,
                               context: UnsafeMutableRawPointer?)
    {
        if keyPath == "estimatedProgress" {
            let progress = Float(self.wkWebView?.estimatedProgress ?? 0)
            self.progressView?.progress = progress
            self.progressView?.isHidden = progress >= 1.0
        }
    }

    @objc func onWebViewGoBack() {
        self.wkWebView?.goBack()
    }

    @objc func onWebViewGoForward() {
        self.wkWebView?.goForward()
    }

    // =============== uiDelegate ===============

    /*
        js弹出Confirm确认框时会调用原生方法，开发者处理完交互后，需要调用completionHandler闭包，这个闭包需要传入一个Bool类型的参数将用户选择的结果返回
     */
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping @MainActor (Bool) -> Void) {}

    // =============== navigationDelegate ===============

    /*
        页面加载完成时调用
     */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.buttonGoBack?.isEnabled = webView.canGoBack
        self.buttonGoForward?.isEnabled = webView.canGoForward
        // iOS调用js方法，例如：
        let jsFunctionWithParams = "getStrLen('MinKin')"
        self.wkWebView?.evaluateJavaScript(jsFunctionWithParams, completionHandler: { result, _ in
            if let value = result as? Int {
                print("getStrLen方法结果为：\(value)")
            }
        })
    }
}
