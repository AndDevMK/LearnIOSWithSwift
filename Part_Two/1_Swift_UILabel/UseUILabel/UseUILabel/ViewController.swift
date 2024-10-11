//
//  ViewController.swift
//  UseUILabel
//
//  Created by 彭明健 on 2024/10/11.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        /**
           添加一个UILabel
         */
        let label1 = UILabel(
            frame: CGRect(
                x: 0,
                y: 50,
                width: self.view.frame.width,
                height: 50
            )
        )
        label1.text = "我是一个普通的UILabel控件"
        // 将UILabel添加到当前视图上
        self.view.addSubview(label1)

        /**
           UILabel常用属性
         */
        let label2 = UILabel(
            frame: CGRect(
                x: 0,
                y: 100,
                width: self.view.frame.width,
                height: 50
            )
        )
        label2.text = "我是一个自定义的UILabel控件"
        // 字体（字号20，加粗的系统字体）
        label2.font = UIFont.boldSystemFont(ofSize: 20)
        // 字体颜色
        label2.textColor = UIColor.red
        // 阴影颜色
        label2.shadowColor = UIColor.green
        // 阴影位置偏移
        label2.shadowOffset = CGSize(width: 2, height: 2)
        // 文字对齐
        label2.textAlignment = NSTextAlignment.right
        // 将UILabel添加到当前视图上
        self.view.addSubview(label2)

        /**
           UILabel多行文本
         */
        let label3 = UILabel(
            frame: CGRect(
                x: 0,
                y: 150,
                width: self.view.frame.width,
                height: 100
            )
        )
        label3.text =
            "我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本我是长文本"
        // 显示行数（如果设置为0，则代表不限制显示行数。但是，如果文本行数总和的高度超出了控件本身的高度，文字依然会被截断）
        label3.numberOfLines = 0
        // 将UILabel添加到当前视图上
        self.view.addSubview(label3)

        /**
           UILabel之Span
         */
        let label4 = UILabel(
            frame: CGRect(
                x: 0,
                y: 250,
                width: self.view.frame.width,
                height: 50
            )
        )
        let attributedText = NSMutableAttributedString(string: "我是个性化文本")
        attributedText.addAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.red,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)
            ],
            range: NSRange(location: 0, length: 2)
        )
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.green
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        attributedText.addAttribute(
            NSAttributedString.Key.shadow,
            value: shadow,
            range: NSRange(location: 3, length: 3)
        )
        label4.attributedText = attributedText
        // 将UILabel添加到当前视图上
        self.view.addSubview(label4)
    }
}
