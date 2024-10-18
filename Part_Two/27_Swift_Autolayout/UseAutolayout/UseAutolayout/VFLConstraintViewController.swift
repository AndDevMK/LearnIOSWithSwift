//
//  VFLConstraintViewController.swift
//  UseAutolayout
//
//  Created by 彭明健 on 2024/10/17.
//

import UIKit

class VFLConstraintViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        /*
            VFL（Visual Format Language，格式化约束语言）创建约束对象。使用象形的方式帮助开发者将复杂的约束关系转换为NSLayoutConstraint约束对象。
            例如：创建一个视图，将其左、上、右边距都设置为20个单位，宽高设置为100个单位
         */
        let targetView = UIView()
        targetView.backgroundColor = UIColor.red
        // 在使用代码进行Autolayout自动布局时，首先需要将自动布局的视图控件的translatesAutoresizingMaskIntoConstraints属性设置为false
        targetView.translatesAutoresizingMaskIntoConstraints = false
        // 在添加约束之前，将子视图添加到父视图上
        self.view.addSubview(targetView)
        /*
             withVisualFormat：VFL字符串
             views：设置为VFL字符串中使用到的视图控件的名称与对应的视图控件对象的映射
             在VFL语言中，H代表水平方向的约束，V代表竖直方向的约束，|符号表示父视图的边沿，-20-表示相距20个单位的距离，[]内是要摆放的视图控件的名称，()内为约束值
         */
        let constraints1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[targetView(100)]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["targetView": targetView])
        let constraints2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[targetView(100)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["targetView": targetView])
        self.view.addConstraints(constraints1)
        self.view.addConstraints(constraints2)
    }
}
