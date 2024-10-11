//
//  ViewController.swift
//  UseUIButton
//
//  Created by 彭明健 on 2024/10/11.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /**
           创建一个UIButton
         */
        let button1 = UIButton(type: .system)
        // 尺寸与位置
        button1.frame = CGRect(x: 25, y: 50, width: 120, height: 40)
        // 背景颜色
        button1.backgroundColor = UIColor.white
        // 字体大小
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        // 圆角
        button1.layer.cornerRadius = 20
        // 按钮可用状态
        button1.isEnabled = true
        // 边框和边框颜色
        var borderColor = CGColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        if button1.isEnabled {
            borderColor = CGColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        } else {
            borderColor = CGColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        }
        button1.layer.borderWidth = 1
        button1.layer.borderColor = borderColor
        // 正常状态下的文字和文字颜色
        button1.setTitle("点击", for: .normal)
        button1.setTitleColor(UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1), for: .normal)
        // 不可用状态下的文字和文字颜色
        button1.setTitle("不能点击", for: .disabled)
        button1.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1), for: .disabled)
        // 点击事件
        button1.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        view.addSubview(button1)

        /**
          带图片的UIButton按钮
         */
        let button2 = UIButton(type: .system)
        // 尺寸与位置
        button2.frame = CGRect(x: 25, y: 100, width: 120, height: 40)
        // 背景颜色
        button2.backgroundColor = UIColor.gray
        // 字体大小
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        // 文字和文字颜色
        button2.setTitle("点击", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        // image
        let image = UIImage(named: "icon_search")?.withRenderingMode(.alwaysOriginal)
        button2.setImage(image, for: .normal)
        button2.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        button2.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.addSubview(button2)
    }

    @objc func onClick() {
        print("click")
    }
}
