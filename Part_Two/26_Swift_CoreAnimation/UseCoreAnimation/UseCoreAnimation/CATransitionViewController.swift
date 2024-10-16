//
//  CATransitionViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class CATransitionViewController: UIViewController, CAAnimationDelegate {
    var targetView1, targetView2: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 20, width: 150, height: 40)
        button.setTitle("startTransition", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.addTarget(self, action: #selector(self.startTransition), for: .touchUpInside)
        self.view.addSubview(button)

        self.targetView1 = UIView(frame: CGRect(x: 20, y: 80, width: 100, height: 100))
        self.targetView1?.backgroundColor = UIColor.red
        self.view.addSubview(self.targetView1!)

        self.targetView2 = UIView(frame: CGRect(x: 20, y: 80, width: 100, height: 100))
        self.targetView2?.backgroundColor = UIColor.blue
        self.view.addSubview(self.targetView2!)
        self.targetView2?.isHidden = true
    }

    var isForward: Bool = true
    var isAnimating: Bool = false

    @objc func startTransition() {
        guard !self.isAnimating else {
            return
        }
        self.isAnimating = true
        // 创建转场动画实例
        let transitionAni = CATransition()
        // 转场动画类型
        transitionAni.type = .push
        // 转场动画方向（fromTop：往上执行）
        transitionAni.subtype = .fromTop
        transitionAni.duration = 2
        transitionAni.timingFunction = CAMediaTimingFunction(name: .easeIn)
        // 动画监听
        transitionAni.delegate = self
        // 设置动画完成后是否保持最后的状态
        transitionAni.fillMode = .forwards
        transitionAni.isRemovedOnCompletion = false

        if self.isForward {
            self.targetView1?.isHidden = true
            self.targetView2?.isHidden = false

            self.targetView2?.layer.add(transitionAni, forKey: nil)

        } else {
            self.targetView1?.isHidden = false
            self.targetView2?.isHidden = true

            self.targetView1?.layer.add(transitionAni, forKey: nil)
        }
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.isForward.toggle()
        self.isAnimating = false
    }
}
