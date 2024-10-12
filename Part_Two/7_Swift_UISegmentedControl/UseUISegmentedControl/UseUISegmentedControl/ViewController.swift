//
//  ViewController.swift
//  UseUISegmentedControl
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let segmentedControl = UISegmentedControl(items: [
            "One", "Two", "Three",
        ])
        segmentedControl.frame = CGRect(x: 20, y: 50, width: 240, height: 40)
        // 默认选中第一个
        segmentedControl.selectedSegmentIndex = 0
        // 选中item背景颜色
        segmentedControl.selectedSegmentTintColor = UIColor.white
        // 背景颜色
        segmentedControl.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.02)
        // 状态监听
        segmentedControl.addTarget(self, action: #selector(onSegmentedControlValueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
    }

    @objc func onSegmentedControlValueChanged(segmentedControl: UISegmentedControl) {
        print("选中item: \(segmentedControl.selectedSegmentIndex)")
    }
}
