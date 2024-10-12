//
//  ViewController.swift
//  UseUIStepper
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let stepper = UIStepper(frame: CGRect(x: 20, y: 100, width: 200, height: 50))
        // 步长
        stepper.stepValue = 1
        // 初始值
        stepper.value = 0
        // 最小/大值
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        // 如果isContinuous属性为true，则用户交互触发的事件方法会不断重复执行；
        // 如果isContinuous属性为false，则只有用户抬起手指时，触发的事件方法才会执行一次。
        stepper.isContinuous = false
        // 用于设置UIStepper的值是否循环，即warps属性为true时，UIStepper控件的值达到极限后会自动进行首尾循环。
        stepper.wraps = false
        // 如果autorepeat属性为true，则UIStepper控件的值会不断发生改变；
        // 如果autorepeat属性为false，则只有当用户抬起手指时，UIStepper控件的值才会改变一次。
        stepper.autorepeat = true
        // 状态监听
        stepper.addTarget(self, action: #selector(onStepperValueChanged), for: .valueChanged)
        view.addSubview(stepper)
    }

    @objc func onStepperValueChanged(stepper: UIStepper) {
        print("当前值为：\(stepper.value)")
    }
}
