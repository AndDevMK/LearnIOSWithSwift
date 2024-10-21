//
//  ViewController.swift
//  Calculator
//
//  Created by 彭明健 on 2024/10/21.
//

import UIKit

/*
    简单计算器：不考虑优先级，统一从左到右计算
 */
class ViewController: UIViewController, KeyBoardLayoutDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }

    var keyBoardLayout: KeyBoardLayout?
    var screenLayout: ScreenLayout?
    let calculatorEngine = CalculatorEngine()
    /*
         标记本次输入是否需要将显示屏已有的内容清除。当用户完成一次计算后，计算结果会显示在显示屏上。
         此时如果用户继续输入，则进行下一轮的计算，显示屏上次的计算结果应该被清空。
     */
    var isNew: Bool = false

    private func setUpUI() {
        // 在进行自动布局之前，必须将其添加到父视图上
        keyBoardLayout = KeyBoardLayout()
        view.addSubview(keyBoardLayout!)
        keyBoardLayout?.delegate = self
        // 使用SnapKit进行约束添加
        keyBoardLayout?.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(keyBoardLayout!.superview!.snp.height).multipliedBy(2 / 3.0)
        }
        // 在进行自动布局之前，必须将其添加到父视图上
        screenLayout = ScreenLayout()
        view.addSubview(screenLayout!)
        // 使用SnapKit进行约束添加
        screenLayout?.snp.makeConstraints { make in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(keyBoardLayout!.snp.top)
        }
    }

    func onKeyClick(content: String) {
        // 如果是这些功能按钮，则进行功能逻辑处理
        if content == "AC" || content == "DEL" || content == "=" {
            switch content {
                case "AC":
                    screenLayout?.clearContent()
                    screenLayout?.refreshHistory()
                case "DEL":
                    screenLayout?.deleteInput()
                case "=":
                    let result = calculatorEngine.calculateEquation(equation: screenLayout!.inputStr)
                    // 先刷新历史
                    screenLayout?.refreshHistory()
                    // 清除输入内容
                    screenLayout?.clearContent()
                    // 将结果输入
                    screenLayout?.inputContent(content: String(result))
                    isNew = true
                default:
                    screenLayout?.refreshHistory()
            }
        } else {
            if isNew {
                screenLayout?.clearContent()
                isNew = false
            }
            screenLayout?.inputContent(content: content)
        }
    }
}
