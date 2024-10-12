//
//  ViewController.swift
//  UseUISwitch
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let uiSwitch = UISwitch(frame: CGRect(x: 20, y: 50, width: 100, height: 50))
        // 开关初始状态
        uiSwitch.isOn = false
        // 开启状态下的轨道颜色
        uiSwitch.onTintColor = UIColor.systemPink
        // 关闭状态下的轨道颜色（失效）
        uiSwitch.tintColor = UIColor.black
        // 滑块颜色
        uiSwitch.thumbTintColor = UIColor.white
        // 状态监听事件
        uiSwitch.addTarget(self, action: #selector(onSwitchValueChanged), for: .valueChanged)
        view.addSubview(uiSwitch)
    }

    @objc func onSwitchValueChanged(uiSwitch: UISwitch) {
        print("开关状态: \(uiSwitch.isOn)")
    }
}
