//
//  ViewController.swift
//  UseUIPickerView
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // 返回分组数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    // 每个分组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }

    // 每个分组中，每行数据的标题（不可调字体样式）
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component)组第\(row)行"
    }

    // 每个分组中，每行数据的标题（可调字体样式，回调优先级比”不可调字体样式“高）
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if component == 0 && row == 0 {
            return NSAttributedString(string: "第\(component)组第\(row)行", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        return NSAttributedString(string: "第\(component)组第\(row)行", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }

    // 每个分组中，每行数据的标题（自定义Item布局，回调优先级比“可调字体样式”高）
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 0 && row == 0 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width / 2, height: 40))
            label.text = "第\(component)组第\(row)行"
            label.font = UIFont.systemFont(ofSize: 30)
            label.textColor = UIColor.red
            label.textAlignment = NSTextAlignment.center
            return label
        }
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width / 2, height: 40))
        label.text = "第\(component)组第\(row)行"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        return label
    }

    // 每个组的宽度
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width / 2
    }

    // 选中行的高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }

    // 当用户滑动UIPickerView控件选中一条数据时回调
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("用户选择了第\(component)组第\(row)行")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let pickerView = UIPickerView(frame: CGRect(x: 20, y: 100, width: self.view.frame.width - 20 - 20, height: 400))
        // 代理
        pickerView.delegate = self
        // 数据源
        pickerView.dataSource = self
        self.view.addSubview(pickerView)
    }
}
