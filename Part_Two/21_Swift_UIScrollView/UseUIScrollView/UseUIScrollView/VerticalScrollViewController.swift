//
//  VerticalScrollViewController.swift
//  UseUIScrollView
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

class VerticalScrollViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let scrollView = UIScrollView(frame: self.view.frame)
        self.view.addSubview(scrollView)

        // 第一个颜色容器
        let redView = UIView(frame: self.view.frame)
        redView.backgroundColor = UIColor.systemRed

        // 第二个颜色容器
        let greenView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: 200))
        greenView.backgroundColor = UIColor.systemGreen

        scrollView.addSubview(redView)
        scrollView.addSubview(greenView)

        // 设置UIScrollView滚动视图的内容区域尺寸
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 200)
    }
}
