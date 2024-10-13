//
//  ViewController.swift
//  UseUIDatePicker
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let datePicker = UIDatePicker(frame: CGRect(x: 20, y: 100, width: self.view.frame.width - 20 - 20, height: 400))
        // 显示模式（倒计时模式）
        datePicker.datePickerMode = .countDownTimer
        // 计时模式下的控件相邻时间的时间间隔（分钟）
        datePicker.minuteInterval = 1
        // 状态监听
        datePicker.addTarget(self, action: #selector(self.onDatePickerValueChanged), for: .valueChanged)
        self.view.addSubview(datePicker)
    }

    @objc func onDatePickerValueChanged(datePicker: UIDatePicker) {
        print("当前倒计时为: \(datePicker.countDownDuration)s")
    }
}
