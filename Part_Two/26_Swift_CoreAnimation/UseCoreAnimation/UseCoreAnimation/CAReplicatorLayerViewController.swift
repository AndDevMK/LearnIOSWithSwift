//
//  CAReplicatorLayerViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class CAReplicatorLayerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 创建拷贝图层
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.anchorPoint = CGPoint(x: 0, y: 0)
        replicatorLayer.position = CGPoint.zero

        // 创建内容图层
        let subLayer = CALayer()
        subLayer.bounds = CGRect(x: 0, y: 0, width: 25, height: 25)
        subLayer.anchorPoint = CGPoint(x: 0, y: 0)
        subLayer.position = CGPoint(x: 20, y: 20)
        subLayer.backgroundColor = UIColor.red.cgColor
        replicatorLayer.addSublayer(subLayer)

        // 设置每次拷贝将副本沿x轴平移45（25宽度+20间隔）个单位
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0)
        // 拷贝副本的个数
        replicatorLayer.instanceCount = 8

        self.view.layer.addSublayer(replicatorLayer)
    }
}
