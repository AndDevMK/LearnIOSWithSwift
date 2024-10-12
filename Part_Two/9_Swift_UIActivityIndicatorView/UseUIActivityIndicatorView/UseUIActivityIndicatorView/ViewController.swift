//
//  ViewController.swift
//  UseUIActivityIndicatorView
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        /**
           菊花Loading
         */
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.center = self.view.center
        // Loading颜色
        activityIndicatorView.color = UIColor.purple
        // 当活动指示器动画停止时，活动指示器本身也将隐藏
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        self.view.addSubview(activityIndicatorView)
    }
}
