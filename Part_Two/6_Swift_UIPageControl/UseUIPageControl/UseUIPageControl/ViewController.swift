//
//  ViewController.swift
//  UseUIPageControl
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let pageControl = UIPageControl(frame: CGRect(x: 20, y: 50, width: self.view.frame.width - 20 - 20, height: 50))
        // 码点数
        pageControl.numberOfPages = 10
        // 当前码点背景色
        pageControl.currentPageIndicatorTintColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
        // 默认码点背景色
        pageControl.pageIndicatorTintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        // 背景色
        pageControl.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08)
        // 可以在点击一个圆点的时候拖拽选择其他的
        pageControl.allowsContinuousInteraction = false
        // 初始选中的码点
        pageControl.currentPage = 0
        // 只有一个码点时隐藏
        pageControl.hidesForSinglePage = true
        // 状态监听
        pageControl.addTarget(self, action: #selector(self.onPageControlValueChanged), for: .valueChanged)
        self.view.addSubview(pageControl)
    }

    @objc func onPageControlValueChanged(pageControl: UIPageControl) {
        print("当前选中的码点为: \(pageControl.currentPage)")
    }
}
