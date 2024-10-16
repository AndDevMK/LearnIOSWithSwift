//
//  CABasicAnimationViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class CABasicAnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let targetView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        targetView.backgroundColor = UIColor.red
        self.view.addSubview(targetView)

        // 创建动画实例，keyPath为要进行属性动画的属性路径
        let basicAni = CABasicAnimation(keyPath: "transform.rotation.z")
        // 从0度开始绕z轴旋转45度
        // 注意：尽管fromValue和toValue的类型是Any?，但你需要确保这些值与keyPath所指向的属性类型相匹配
        basicAni.fromValue = NSNumber(value: 0)
        basicAni.toValue = NSNumber(value: Double.pi / 4)
        basicAni.duration = 2
        // 设置动画完成后是否保持最后的状态
        basicAni.fillMode = .forwards
        basicAni.isRemovedOnCompletion = false
        // 将动画作用于当前View视图的Layer层上。forKey用于给添加到图层的动画指定一个唯一的键。
        targetView.layer.add(basicAni, forKey: nil)
    }
}
