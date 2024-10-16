//
//  UIViewTransitionAnimationViewController.swift
//  UseUIViewAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class UIViewTransitionAnimationViewController: UIViewController {
    var targetView1, targetView2: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        /*
            TransitionCurl Animation
         */
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x: 20, y: 20, width: 240, height: 40)
        button1.setTitle("TransitionCurl Animation", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = UIColor.systemBlue
        button1.addTarget(self, action: #selector(onTransitionCurlAnimation), for: .touchUpInside)
        view.addSubview(button1)

        targetView1 = UIView(frame: CGRect(x: 20, y: 80, width: 200, height: 200))
        targetView1?.backgroundColor = UIColor.systemRed
        view.addSubview(targetView1!)

        /*
            TransitionFlip Animation
         */
        let button2 = UIButton(type: .system)
        button2.frame = CGRect(x: 20, y: 300, width: 240, height: 40)
        button2.setTitle("TransitionFlip Animation", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor.systemBlue
        button2.addTarget(self, action: #selector(onTransitionFlipAnimation), for: .touchUpInside)
        view.addSubview(button2)

        targetView2 = UIView(frame: CGRect(x: 20, y: 360, width: 200, height: 200))
        targetView2?.backgroundColor = UIColor.systemRed
        view.addSubview(targetView2!)
    }

    /*
        TransitionCurl Animation
     */
    var isForward1: Bool = true
    var isAnimating1: Bool = false

    @objc func onTransitionCurlAnimation() {
        guard !isAnimating1 else {
            return
        }
        isAnimating1 = true
        UIView.transition(with: targetView1!,
                          duration: 2,
                          options: isForward1 ? .transitionCurlUp : .transitionCurlDown,
                          animations: {
                              // 如果animations闭包中什么都不写，视图依然会执行转场动画，只是转场后的视图与原视图表现一致
                          },
                          completion: { _ in
                              self.isForward1.toggle()
                              self.isAnimating1 = false
                          })
    }

    /*
        TransitionFlip Animation
     */
    var isForward2: Bool = true
    var isAnimating2: Bool = false
    var tempFromTargetView, tempToTargetView: UIView?
    var isFirst: Bool = true

    @objc func onTransitionFlipAnimation() {
        guard !isAnimating2 else {
            return
        }
        isAnimating2 = true

        // 这个方法的实质是将原视图控件从其父视图上移除，而将新的视图控件添加到原控件的父视图上，其动画效果实际上作用在它们的父视图上，这个方法可以直接切换整个视图控件，对于变化较大或者完全无关联的两种视图的内容切换十分有用。
        if isForward2 {
            tempFromTargetView = isFirst ? targetView2 : tempToTargetView
            let toTargetView = UIView(frame: CGRect(x: 20, y: 360, width: 200, height: 200))
            toTargetView.backgroundColor = UIColor.systemBlue
            tempToTargetView = toTargetView
        } else {
            tempFromTargetView = tempToTargetView
            let toTargetView = UIView(frame: CGRect(x: 20, y: 360, width: 200, height: 200))
            toTargetView.backgroundColor = UIColor.systemRed
            tempToTargetView = toTargetView
        }

        UIView.transition(from: tempFromTargetView!,
                          to: tempToTargetView!,
                          duration: 2,
                          options: isForward2 ? .transitionFlipFromRight : .transitionFlipFromLeft,
                          completion: { _ in
                              self.isFirst = false
                              self.isForward2.toggle()
                              self.isAnimating2 = false
                          })
    }
}
