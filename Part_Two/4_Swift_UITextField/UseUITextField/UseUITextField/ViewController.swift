//
//  ViewController.swift
//  UseUITextField
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        /**
           创建一个UITextField
         */
        let textField = UITextField(frame: CGRect(x: 20, y: 50, width: self.view.frame.width - 40, height: 50))
        // 背景
        textField.backgroundColor = UIColor.white
        // 文字颜色
        textField.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        // 提示文字
        textField.attributedPlaceholder =
            NSAttributedString(string: "搜索",
                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1),
                                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        // 边框风格
        textField.borderStyle = .none
        // 自定义边框
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        // 圆角
        textField.layer.cornerRadius = textField.frame.height/2
        // 左视图：搜索按钮（width: 左边距 + 图片宽度 + 右边距）
        let leftContainer = UIView(frame: CGRect(x: 0, y: 0, width: 16 + 22 + 10, height: textField.frame.height))
        // 图片大小为22X22
        let imageView = UIImageView(image: UIImage(named: "icon_search")?.withRenderingMode(.alwaysOriginal))
        imageView.frame = CGRect(x: 16, y: (textField.frame.height - 22)/2, width: 22, height: 22)
        leftContainer.addSubview(imageView)
        textField.leftView = leftContainer
        textField.leftViewMode = .always
        // 右视图：占位区域，实现右内边距
        let rightContainer = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.rightView = rightContainer
        textField.rightViewMode = .always
        // 事件监听
        textField.delegate = self
        self.view.addSubview(textField)
    }

    /**
       在UITextField控件即将进入编辑模式时会被调用，其中需要返回一个Bool类型的值作为返回值，如果返回true，则允许输入框进入编辑状态，否则不允许。
     */
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("即将进入编辑模式")
        return true
    }

    /**
       如果textFieldShouldBeginEditing方法返回true，之后会调用textFieldDidBeginEditing，这个方法的调用标志着UITextField控件正式进入编辑状态。
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("正式进入编辑状态")
    }

    /**
       与textFieldShouldBeginEditing方法相对应，其在UITextField控件将要结束编辑时会被调用，同样，这个方法需要一个Bool类型的返回值，如果返回true，则允许结束编辑状态，否则不允许。
     */
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("将要结束编辑")
        return true
    }

    /**
       方法与textFieldShouldBeginEditing方法相对应，其在UITextField结束编辑状态后会被调用。
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("已结束编辑状态")
    }

    /**
       1、最重要的一个回调方法，开发者对用户输入文本的监听就是通过这个方法来实现的。
       2、当UITextField控件中的文字变化时就会调用这个方法，包括追加文字和删除文字。
       3、这个方法中将传递3个参数给开发者，其中第1个参数为文字发生改变的UITextField控件，第2个参数为文字发生变化的范围，第3个参数为变化后的字符串。
       4、这个方法也需要一个Bool类型的返回值，如果返回true，则允许此次变化，否则不允许此次变化。
     */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("当前输入text: \(textField.text!)")
        return true
    }

    /**
       在用户点击了文本输入框上的清除按钮时会被调用，如果返回true，则允许此次清除操作，否则不允许。
       通过设置UITextField类的clearButtonMode属性来设置清除按钮的显示模式，例如：textField.clearButtonMode = .always
     */
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("点击了文本输入框上的清除按钮")
        return true
    }

    /**
       在用户点击了虚拟键盘上的Return键时会被调用，开发者通常会在这个方法中结束输入框编辑状态，即收键盘的动作。
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("点击了虚拟键盘上的Return键")
        // UITextField控件一旦进入编辑状态，就不会自动结束编辑，开发者需要手动注销UITextField控件的第一响应来结束它的编辑状态。
        // 当UITextField控件的编辑状态结束后，系统会自动将虚拟键盘收起。
        textField.resignFirstResponder()
        return true
    }
}
