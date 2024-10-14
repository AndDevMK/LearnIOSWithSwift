//
//  UIWebViewViewController.swift
//  UseUIWebViewAndWKWebView
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

class UIWebViewViewController: UIViewController, UIWebViewDelegate {
    var webView: UIWebView?
    var buttonGoBack, buttonGoForward: UIButton?

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

        // WebView
        self.webView = UIWebView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height - 50))
        let url = URL(string: "https://www.baidu.com")
        // http不安全链接，需要配置Info.plist文件的配置项App Transport Security Settings
//        let url = URL(string: "http://www.people.com.cn")
        let urlRequest = URLRequest(url: url!)
        self.webView?.delegate = self
        self.webView?.loadRequest(urlRequest)
        self.view.addSubview(self.webView!)
    }

    @objc func onWebViewGoBack() {
        self.webView?.goBack()
    }

    @objc func onWebViewGoForward() {
        self.webView?.goForward()
    }

    /*
        当视图将要开始加载URL请求时被调用，返回false禁止此次加载
     */
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        // 可以截获UIWebView将要加载的URL请求，可以进行请求参数的重设，也可以拦截此请求，禁止其加载，从而进行自己的业务逻辑处理。
        return true
    }

    /*
        当视图已经开始加载URL请求时被调用
     */
    func webViewDidStartLoad(_ webView: UIWebView) {}

    /*
        视图加载完成时被调用
     */
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.buttonGoBack?.isEnabled = webView.canGoBack
        self.buttonGoForward?.isEnabled = webView.canGoForward
    }

    /*
        视图加载失败时被调用
     */
    func webView(_ webView: UIWebView, didFailLoadWithError error: any Error) {}
}
