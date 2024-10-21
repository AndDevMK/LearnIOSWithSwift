//
//  KeyBoardLayout.swift
//  Calculator
//
//  Created by 彭明健 on 2024/10/21.
//

import SnapKit
import UIKit

/*
    键盘布局
 */
class KeyBoardLayout: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpKeysUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var keyTextArr = [
        "0", ".", "%", "=",
        "1", "2", "3", "+",
        "4", "5", "6", "-",
        "7", "8", "9", "*",
        "AC", "DEL", "^", "/"
    ]

    var delegate: KeyBoardLayoutDelegate?

    /*
         将按钮的排版定位为5行4列，布局的顺序为从下向上、从左向右依次布局。
         最底部的一行和最左侧的一列与父视图边界对齐，其余位置的功能按钮则参照其上一个按钮的位置进行约束布局。
     */
    private func setUpKeysUI() {
        var frontKey: KeyButton!
        for index in 0 ..< self.keyTextArr.count {
            // 在进行自动布局之前，必须将其添加到父视图上
            let curKey = KeyButton()
            self.addSubview(curKey)
            // 使用SnapKit进行约束添加
            curKey.snp.makeConstraints { make in
                // 当按钮为每一行的第一个时，将其靠父视图左侧摆放（最左侧的一列与父视图边界对齐）
                if index % 4 == 0 {
                    make.left.equalTo(0)
                } else {
                    // 否则，将按钮的左边靠其上一个按钮的右侧摆放
                    make.left.equalTo(frontKey.snp.right)
                }

                // 当按钮为第一行时（"0", ".", "%", "="），将其靠父视图底部摆放（最底部的一行与父视图边界对齐）
                if index / 4 == 0 {
                    make.bottom.equalTo(0)
                } else if index % 4 == 0 {
                    // 当按钮不在第一行且为每行的第一个时（"1", "4", "7", "AC"），将其底部与上一个按钮的顶部对齐
                    make.bottom.equalTo(frontKey.snp.top)
                } else {
                    // 否则，其余按钮将其底部与上一个按钮的底部对齐（比如"2"的底部与"1"的底部对齐，"3"的底部与"2"的底部对齐等）
                    make.bottom.equalTo(frontKey.snp.bottom)
                }

                // 约束宽度为父视图宽度的0.25倍
                make.width.equalTo(curKey.superview!.snp.width).multipliedBy(0.25)
                // 约束高度为父视图高度的0.2倍
                make.height.equalTo(curKey.superview!.snp.height).multipliedBy(0.2)
            }
            // 设置一个tag标记
            curKey.tag = index + 100
            // 添加点击事件
            curKey.addTarget(self, action: #selector(self.onKeyClick), for: .touchUpInside)
            // 设置按钮text
            curKey.setTitle(self.keyTextArr[index], for: .normal)
            // 保存上一个按钮
            frontKey = curKey
        }
    }

    @objc func onKeyClick(key: KeyButton) {
        print(key.title(for: .normal)!)
        self.delegate?.onKeyClick(content: key.currentTitle!)
    }
}

protocol KeyBoardLayoutDelegate {
    func onKeyClick(content: String)
}
