//
//  ViewController.swift
//  UseUIWebViewAndWKWebView
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func useUIWebView(_ sender: Any) {
        // 使用UIWebView
        self.present(UIWebViewViewController(), animated: true, completion: {
            print("切换UIWebViewViewController完成")
        })
    }

    @IBAction func useWKWebView(_ sender: Any) {
        // 使用WKWebView
        self.present(WKWebViewViewController(), animated: true, completion: {
            print("切换WKWebViewViewController完成")
        })
    }
}
