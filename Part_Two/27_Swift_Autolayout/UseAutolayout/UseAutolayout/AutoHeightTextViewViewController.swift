//
//  AutoHeightTextViewViewController.swift
//  UseAutolayout
//
//  Created by 彭明健 on 2024/10/18.
//

import SnapKit
import UIKit

class AutoHeightTextViewViewController: UIViewController, UITextViewDelegate {
    var textView: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        // 创建文本域控件
        textView = UITextView()
        textView?.textColor = UIColor.black
        textView?.font = UIFont.systemFont(ofSize: 20)
        textView?.layer.borderWidth = 1
        textView?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        textView?.delegate = self
        view.addSubview(textView!)

        // 添加文本域控件的约束
        textView?.snp.makeConstraints { make in
            make.leading.equalTo(100)
            make.trailing.equalTo(-100)
            make.top.equalTo(150)
            make.height.equalTo(40)
        }
    }

    /*
        监听用户输入
     */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // 文本域控件高度在>=100时，如果出现文字内容减少，那么文本域控件高度需要调整为文字内容高度
        if textView.bounds.size.height >= 100 &&
            textView.contentSize.height < textView.bounds.size.height
        {
            textView.snp.updateConstraints { make in
                make.height.equalTo(textView.contentSize.height)
            }
        }

        // 文本域控件高度在100范围内随文字内容大小而变化
        if textView.bounds.size.height != textView.contentSize.height &&
            textView.bounds.size.height < 100
        {
            textView.snp.updateConstraints { make in
                make.height.equalTo(textView.contentSize.height)
            }
            // 布局变化使用动画过渡
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
        return true
    }
}
