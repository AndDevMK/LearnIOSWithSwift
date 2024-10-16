//
//  CAEmitterLayerViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/17.
//

import UIKit

class CAEmitterLayerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        /*
            发射引擎
         */
        // 创建粒子发射引擎
        let emitterLayer = CAEmitterLayer()
        // 发射引擎的位置和尺寸（放到屏幕底部中间）
        emitterLayer.emitterPosition = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height - 20)
        emitterLayer.emitterSize = CGSize(width: 100, height: 20)
        // 粒子的渲染模式（混合模式）
        emitterLayer.renderMode = .additive
        /*
            粒子单元
         */
        // 配置2个粒子单元，一个用来渲染火焰，另一个用来渲染烟雾
        let fireCell = CAEmitterCell()
        // 每秒产生1500个粒子
        fireCell.birthRate = 1500
        // 每个粒子存活时间（3s）
        fireCell.lifetime = 3
        // 粒子存活时间的随机范围（1.5s）
        fireCell.lifetimeRange = 1.5
        // 粒子渲染颜色
        fireCell.color = UIColor(red: 0.8, green: 0.4, blue: 0.2, alpha: 0.1).cgColor
        // 粒子的内容
        fireCell.contents = UIImage(named: "fire")?.cgImage
        // 粒子运动速度
        fireCell.velocity = 120
        // 粒子运动速度的随机范围
        fireCell.velocityRange = 60
        // 粒子在x-y平面的发射角度
        fireCell.emissionLongitude = CGFloat(Double.pi + Double.pi / 2)
        // 粒子发射角度的随机范围
        fireCell.emissionRange = CGFloat(Double.pi)
        // 粒子的缩放速率
        fireCell.scaleSpeed = 0.5
        // 粒子的旋转
        fireCell.spin = 0.2

        let smokeCell = CAEmitterCell()
        // 每秒产生1000个粒子
        smokeCell.birthRate = 1000
        // 每个粒子存活时间（4s）
        smokeCell.lifetime = 4
        // 粒子存活时间的随机范围（1.5s）
        smokeCell.lifetimeRange = 1.5
        // 粒子渲染颜色
        smokeCell.color = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05).cgColor
        // 粒子的内容
        smokeCell.contents = UIImage(named: "fire")?.cgImage
        // 粒子运动速度
        smokeCell.velocity = 200
        // 粒子运动速度的随机范围
        smokeCell.velocityRange = 100
        // 粒子在x-y平面的发射角度
        smokeCell.emissionLongitude = CGFloat(Double.pi + Double.pi / 2)
        // 粒子发射角度的随机范围
        smokeCell.emissionRange = CGFloat(Double.pi)

        // 设置粒子发射引擎的粒子单元
        emitterLayer.emitterCells = [fireCell, smokeCell]

        self.view.layer.addSublayer(emitterLayer)
    }
}
