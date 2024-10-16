//
//  CASpringAnimationViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class CASpringAnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let targetView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        targetView.backgroundColor = UIColor.red
        self.view.addSubview(targetView)

        // 创建动画实例，keyPath为要进行属性动画的属性路径
        let springAni = CASpringAnimation(keyPath: "position.y")
        // 模拟重物质量，必须大于0，默认为1，会影响惯性
        springAni.mass = 2
        // 模拟弹簧劲度系数，必须大于0，这个值越大则回弹越快
        springAni.stiffness = 20
        // 阻尼系数，必须大于0，这个值越大则回弹的幅度越小
        springAni.damping = 2
        // 从0度开始绕z轴旋转45度
        // 注意：尽管fromValue和toValue的类型是Any?，但你需要确保这些值与keyPath所指向的属性类型相匹配
        springAni.fromValue = NSNumber(value: 100)
        springAni.toValue = NSNumber(value: 300)
        springAni.duration = 5
        // 设置动画完成后是否保持最后的状态
        springAni.fillMode = .forwards
        springAni.isRemovedOnCompletion = false
        // 将动画作用于当前View视图的Layer层上。forKey用于给添加到图层的动画指定一个唯一的键。
        targetView.layer.add(springAni, forKey: nil)
    }
}
