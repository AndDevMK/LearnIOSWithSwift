//
//  ViewController.swift
//  UseUISlider
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let slider = UISlider(frame: CGRect(x: 20, y: 100, width: self.view.frame.width - 20 - 20, height: 30))
        // 滑块最小/最大值
        slider.minimumValue = 0
        slider.maximumValue = 100
        // 滑块初始值
        slider.value = 30
        // 滑块左侧进度条颜色
        slider.minimumTrackTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        // 滑块右侧进度条颜色
        slider.maximumTrackTintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 0.2)
        // 滑块颜色
        slider.thumbTintColor = UIColor.white
        // 状态监听
        slider.addTarget(self, action: #selector(self.onSlideValueChanged), for: .valueChanged)
        // 只有当用户手指离开滑块时，UISlider控件的触发方法才会被执行，并且直接获取到滑块控件停止时的值
        slider.isContinuous = false
        self.view.addSubview(slider)
    }

    @objc func onSlideValueChanged(slider: UISlider) {
        print("滑块当前进度为：\(Int(slider.value))")
    }
}
