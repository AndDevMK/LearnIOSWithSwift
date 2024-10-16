//
//  UIVIewPropertyAnimationViewController.swift
//  UseUIViewAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class UIVIewPropertyAnimationViewController: UIViewController {
    var targetView1, targetView2: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        /*
            背景色渐变Animation
         */
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x: 20, y: 20, width: 240, height: 40)
        button1.setTitle("背景色渐变Animation", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = UIColor.systemBlue
        button1.addTarget(self, action: #selector(onBackgroundColorAnimation), for: .touchUpInside)
        view.addSubview(button1)

        targetView1 = UIView(frame: CGRect(x: 20, y: 80, width: 100, height: 100))
        targetView1?.backgroundColor = UIColor.systemRed
        view.addSubview(targetView1!)

        /*
            背景色渐变和位置平移组合Animation
         */
        let button2 = UIButton(type: .system)
        button2.frame = CGRect(x: 20, y: 200, width: 300, height: 40)
        button2.setTitle("背景色渐变和位置平移组合Animation", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor.systemBlue
        button2.addTarget(self, action: #selector(onBackgroundColorAndOffsetAnimation), for: .touchUpInside)
        view.addSubview(button2)

        targetView2 = UIView(frame: CGRect(x: 20, y: 260, width: 100, height: 100))
        targetView2?.backgroundColor = UIColor.systemRed
        view.addSubview(targetView2!)
    }

    /*
        背景色渐变Animation
     */
    var isForward1: Bool = true
    var isAnimating1: Bool = false

    @objc func onBackgroundColorAnimation() {
        guard !isAnimating1 else {
            return
        }
        isAnimating1 = true
        UIView.animate(withDuration: 2, animations: {
            self.targetView1?.backgroundColor = self.isForward1 ? UIColor.systemBlue : UIColor.systemRed
        }, completion: { _ in
            self.isForward1.toggle()
            self.isAnimating1 = false
        })
    }

    /*
        背景色渐变和位置平移组合Animation
     */
    var isForward2: Bool = true
    var isAnimating2: Bool = false

    @objc func onBackgroundColorAndOffsetAnimation() {
        guard !isAnimating2 else {
            return
        }
        isAnimating2 = true
        if isForward2 {
            UIView.animate(withDuration: 2, animations: {
                self.targetView2?.backgroundColor = UIColor.systemBlue
            }, completion: { _ in
                // 还可以进行动画参数与延时的配置
                UIView.animate(withDuration: 2, delay: 0, options: [UIView.AnimationOptions.curveEaseOut], animations: {
                    self.targetView2?.center = CGPoint(x: 280, y: 310)
                }, completion: { _ in
                    self.isForward2.toggle()
                    self.isAnimating2 = false
                })
            })
        } else {
            // 添加阻尼系数，实现类似弹簧效果。
            // usingSpringWithDamping参数设置阻尼系数，其取值范围为0～1，1表示无弹回效果，0表示剧烈回弹效果；initalSpringVelocity参数设置初始速度，取值范围也是0～1。
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [UIView.AnimationOptions.curveEaseIn], animations: {
                self.targetView2?.center = CGPoint(x: 70, y: 310)
            }, completion: { _ in
                UIView.animate(withDuration: 2, animations: {
                    self.targetView2?.backgroundColor = UIColor.systemRed
                }, completion: { _ in
                    self.isForward2.toggle()
                    self.isAnimating2 = false
                })
            })
        }
    }
}
