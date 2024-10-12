//
//  ViewController.swift
//  UseUIProgressView
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 20 - 20, height: 10)
        // 当前进度
        progressView.progress = 0.3
        // 轨道颜色
        progressView.trackTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        // 进度颜色
        progressView.progressTintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        self.view.addSubview(progressView)
    }
}
