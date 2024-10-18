//
//  AutoLayoutBySnapKitViewController.swift
//  UseAutolayout
//
//  Created by 彭明健 on 2024/10/17.
//

import SnapKit
import UIKit

class AutoLayoutBySnapKitViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let targetView = UIView()
        targetView.backgroundColor = UIColor.red
        // 在添加约束之前，将子视图添加到父视图上
        self.view.addSubview(targetView)

        /*
            将视图约束在界面中间
         */
        // 使用SnapKit添加约束
        targetView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(self.view)
        }
    }
}
