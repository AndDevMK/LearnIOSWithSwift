//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by 彭明健 on 2024/10/21.
//

import UIKit

class CalculatorEngine: NSObject {
    // 运算符集合
    private let funcArr: CharacterSet = ["+", "-", "*", "/", "%", "^"]

    func calculateEquation(equation: String) -> Double {
        // 以运算符进行分割获取所有数字
        let components = equation.components(separatedBy: funcArr)
        // 运算标记游标
        var cursor = 0
        // 运算结果
        var result = Double(components[0])!
        // 遍历计算表达式
        for char in equation {
            switch char {
                // 加法运算
                case "+":
                    cursor += 1
                    if components.count > cursor {
                        result += Double(components[cursor])!
                    }
                // 减法运算
                case "-":
                    cursor += 1
                    if components.count > cursor {
                        result -= Double(components[cursor])!
                    }
                // 乘法运算
                case "*":
                    cursor += 1
                    if components.count > cursor {
                        result *= Double(components[cursor])!
                    }
                // 除法运算
                case "/":
                    cursor += 1
                    if components.count > cursor {
                        result /= Double(components[cursor])!
                    }
                // 取余运算
                case "%":
                    cursor += 1
                    if components.count > cursor {
                        result = Double(Int(result) % Int(components[cursor])!)
                    }
                // 指数运算
                case "^":
                    cursor += 1
                    if components.count > cursor {
                        let temp = result
                        for _ in 1 ..< Int(components[cursor])! {
                            result *= temp
                        }
                    }
                default:
                    break
            }
        }
        return result
    }
}
