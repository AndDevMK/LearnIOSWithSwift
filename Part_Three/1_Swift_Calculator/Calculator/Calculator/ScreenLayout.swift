//
//  ScreenLayout.swift
//  Calculator
//
//  Created by 彭明健 on 2024/10/21.
//

import UIKit

/*
    计算显示布局
 */
class ScreenLayout: UIView {
    // 用于显示用户输入信息
    var inputLabel: UILabel?
    // 用于显示历史记录信息
    var historyLabel: UILabel?
    // 用户输入表达式或者计算结果字符串
    var inputStr: String = ""
    // 历史表达式字符串
    var historyStr: String = ""
    // 所有数字字符，用于进行检测匹配
    let figureArr: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
    // 所有运算功能字符，用于进行检测匹配
    let funcArr: [Character] = ["+", "-", "*", "/", "%", "^"]

    init() {
        inputLabel = UILabel()
        historyLabel = UILabel()
        super.init(frame: CGRect.zero)
        setUpScreenUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpScreenUI() {
        // 文字对齐方式
        inputLabel?.textAlignment = .right
        historyLabel?.textAlignment = .right
        // 文字颜色
        inputLabel?.textColor = UIColor.orange
        historyLabel?.textColor = UIColor.black
        // 字体大小
        inputLabel?.font = UIFont.systemFont(ofSize: 80)
        historyLabel?.font = UIFont.systemFont(ofSize: 30)
        // 文字大小根据字数进行适配
        inputLabel?.adjustsFontSizeToFitWidth = true
        inputLabel?.minimumScaleFactor = 0.5
        historyLabel?.adjustsFontSizeToFitWidth = true
        historyLabel?.minimumScaleFactor = 0.5
        // 文字截断方式
        /*
             byWordWrapping: 按单词换行
             byCharWrapping: 按字符换行
             byClipping: 不换行也不截断，只是简单地裁剪掉超出部分
             byTruncatingHead: 截断头部
             byTruncatingTail: 截断尾部
             byTruncatingMiddle: 在中间插入省略号并截断两边的文本
         */
        inputLabel?.lineBreakMode = .byTruncatingHead
        historyLabel?.lineBreakMode = .byTruncatingHead
        // 文字行数（无限制）
        inputLabel?.numberOfLines = 0
        historyLabel?.numberOfLines = 0

        addSubview(inputLabel!)
        addSubview(historyLabel!)

        // 进行自动布局
        historyLabel?.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(inputLabel!.snp.top).offset(-10)
            // offset(-10)的作用是在最终确定的高度上减去10个单位长度，使得historyLabel的高度略小于其父视图高度的0.3。
            make.height.equalTo(historyLabel!.superview!.snp.height).multipliedBy(0.3).offset(-10)
        }
        inputLabel?.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            make.height.equalTo(inputLabel!.superview!.snp.height).multipliedBy(0.3).offset(-10)
        }
    }

    /*
        信息输入
     */
    func inputContent(content: String) {
        // 如果不是数字也不是运算符，不处理
        if !figureArr.contains(content.last!) && !funcArr.contains(content) {
            return
        }
        // 如果不是首次输入字符
        if inputStr.count > 0 {
            // 数字后面可以任意输入
            if figureArr.contains(inputStr.last!) {
                inputStr.append(content)
                inputLabel?.text = inputStr
            } else {
                // 运算符后面只能输入数字
                if figureArr.contains(content.last!) {
                    inputStr.append(content)
                    inputLabel?.text = inputStr
                }
            }
        } else {
            // 只有数字可以作为首个字符
            if figureArr.contains(content.last!) {
                inputStr.append(content)
                inputLabel?.text = inputStr
            }
        }
    }

    /*
        刷新历史记录
     */
    func refreshHistory() {
        historyStr = inputStr
        historyLabel?.text = historyStr
    }

    /*
        清空显示屏中当前输入的信息
     */
    func clearContent() {
        inputStr = ""
    }

    /*
        删除显示屏中上次输入的字符
     */
    func deleteInput() {
        if inputStr.count > 0 {
            inputStr.remove(at: inputStr.index(before: inputStr.endIndex))
            inputLabel?.text = inputStr
        }
    }
}
