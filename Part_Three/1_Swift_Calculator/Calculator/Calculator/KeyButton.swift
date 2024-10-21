//
//  KeyButton.swift
//  Calculator
//
//  Created by 彭明健 on 2024/10/21.
//

import UIKit

/*
    按键
 */
class KeyButton: UIButton {
    init() {
        // 使用自动布局之后不需要设置frame
        super.init(frame: CGRect.zero)
        // 边框
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 219 / 255, green: 219 / 255, blue: 219 / 255, alpha: 1).cgColor
        // 字体大小与字体颜色
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.setTitleColor(UIColor.orange, for: .normal)
        self.setTitleColor(UIColor.black, for: .highlighted)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
