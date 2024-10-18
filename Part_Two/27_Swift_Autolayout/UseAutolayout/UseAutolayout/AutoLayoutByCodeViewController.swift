//
//  AutoLayoutByCodeViewController.swift
//  UseAutolayout
//
//  Created by 彭明健 on 2024/10/17.
//

import UIKit

class AutoLayoutByCodeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        /*
            将一个自定义视图的宽度和高度都约束为200个单位，且将视图的位置约束到其父视图的中心。
         */
        let targetView = UIView()
        targetView.backgroundColor = UIColor.red
        // 在使用代码进行Autolayout自动布局时，首先需要将自动布局的视图控件的translatesAutoresizingMaskIntoConstraints属性设置为false
        targetView.translatesAutoresizingMaskIntoConstraints = false
        // 在添加约束之前，将子视图添加到父视图上
        self.view.addSubview(targetView)

        /*
             NSLayoutConstraint：用于创建具体的约束对象
             item：要添加约束的视图控件
             attribute：约束的属性，对应NSLayoutAttribute的枚举值
                /*
                     left：左侧约束。
                     right：右侧约束。
                     top：上侧约束。
                     bottom：下侧约束。
                     leading：正方向的边距约束。
                     trailing：逆方向的边距约束。
                     width：宽度约束。
                     height：高度约束。
                     centerX：水平中心约束。
                     centerY：竖直中心约束。
                     notAnAttribute：无意义。
                 */
             relatedBy：约束的方式，对应NSLayoutRelation类型的枚举
                /*
                 lessThanOrEqual：实际值不大于约束值
                 equal：实际值严格等于约束值
                 greaterThanOrEqual：实际值不小于约束值
                 */
             toItem：其约束参照的另一个视图控件，其后的attribute参数为约束的属性
             multiplier：约束的比例 (乘数)。
                /*
                    例如：如果有一个约束表示为view1.height = view2.height * multiplier + constant，那么multiplier就是指定了view1的高度相对于view2高度的比例。
                 */
             constant：约束值。
         */
        let layoutConstraint1 = NSLayoutConstraint(item: targetView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let layoutConstraint2 = NSLayoutConstraint(item: targetView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let layoutConstraint3 = NSLayoutConstraint(item: targetView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        let layoutConstraint4 = NSLayoutConstraint(item: targetView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)

        // 为当前界面添加约束
        self.view.addConstraints([layoutConstraint1, layoutConstraint2, layoutConstraint3, layoutConstraint4])
    }
}
