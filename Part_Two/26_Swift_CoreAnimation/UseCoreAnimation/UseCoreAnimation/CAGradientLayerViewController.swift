//
//  CAGradientLayerViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class CAGradientLayerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 创建图层对象
        let gradientLayer = CAGradientLayer()
        // 图层位置与尺寸
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        // 图层锚点相对父层Layer的位置
        gradientLayer.position = CGPoint(x: 20, y: 20)
        // 图层锚点相对自身Layer的位置（(0, 0)点表示左上角）
        gradientLayer.anchorPoint = CGPoint(x: 0, y: 0)
        // 渐变色
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        // 渐变的临界点（当红色渲染到0.25后开始向绿色进行渐变，绿色渲染到0.5后开始向蓝色进行渐变，当到达0.75距离后完成渐变过程，开始渲染为纯蓝色。）
        gradientLayer.locations = [NSNumber(value: 0.25), NSNumber(value: 0.5), NSNumber(value: 0.75)]
        // 渐变的起始点与结束点（用来控制渐变的方向，其(0,0)点为左上角，(1,1)点为右下角）
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        self.view.layer.addSublayer(gradientLayer)
    }
}
