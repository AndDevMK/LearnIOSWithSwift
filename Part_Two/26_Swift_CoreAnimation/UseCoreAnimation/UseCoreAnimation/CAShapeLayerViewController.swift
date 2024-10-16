//
//  CAShapeLayerViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class CAShapeLayerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 创建图层
        let shapeLayer = CAShapeLayer()
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        shapeLayer.position = CGPoint(x: 0, y: 0)
        // 创建图形路径
        let path = CGMutablePath()
        // 路径起点
        path.move(to: CGPoint(x: 200, y: 200))
        // 画线
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: 150, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 200))
        // 设置图层路径
        shapeLayer.path = path
        // 线条的起点与终点（从0.0到1.0的浮点数值，其中0.0表示路径的起点，1.0表示路径的终点。例如，如果strokeStart设置为0.25，则描边将从路径长度的25%处开始）
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        // 线条颜色
        shapeLayer.strokeColor = UIColor.red.cgColor
        // 线条宽度
        shapeLayer.lineWidth = 1
        // 填充规则（CAShapeLayerFillRule.evenOdd：通过从一个点向任意方向画一条射线来判断该点是否在填充区域内。如果这条射线与路径相交的次数是奇数，则认为这个点在填充区域内；如果相交次数是偶数，则认为不在填充区域内。）
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        // 填充颜色
        shapeLayer.fillColor = UIColor.red.cgColor

        self.view.layer.addSublayer(shapeLayer)
    }
}
