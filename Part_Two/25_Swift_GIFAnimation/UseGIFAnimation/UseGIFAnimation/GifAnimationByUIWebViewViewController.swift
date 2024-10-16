//
//  GifAnimationByUIWebViewViewController.swift
//  UseGIFAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class GifAnimationByUIWebViewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let webView = UIWebView(frame: CGRect(x: 20, y: 100, width: 200, height: 200))
        self.view.addSubview(webView)
        self.playGIFOnWebView(name: "image", webView: webView)
    }

    func playGIFOnWebView(name: String, webView: UIWebView) {
        // gif路径
        if let gifPath = Bundle.main.path(forResource: name, ofType: "gif") {
            // 通过gif路径创建URL
            let url = URL(fileURLWithPath: gifPath)
            // 将gif读成data数据
            if let imageData = try? Data(contentsOf: url) {
                // webView不允许滚动
                webView.scrollView.bounces = false
                // webView背景色透明
                webView.backgroundColor = UIColor.clear
                // webView自适应缩放
                webView.scalesPageToFit = true
                // 加载gif
                webView.load(imageData, mimeType: "image/gif", textEncodingName: "", baseURL: URL(string: Bundle.main.bundlePath)!)
            }
        }
    }
}
