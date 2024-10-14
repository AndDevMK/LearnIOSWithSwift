//
//  ViewController.swift
//  UseUAlertController
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertDialog(_ sender: Any) {
        // 弹出AlertDialog
        let alertController = UIAlertController(title: "温馨提示", message: "您确定删除所有历史记录吗？", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: { (_: UIAlertAction) in
            print("点击了确定按钮")
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("点击了取消按钮")
        }))
        self.present(alertController, animated: true, completion: {
            print("弹出AlertDialog完成")
        })
    }

    @IBAction func showActionSheetDialog(_ sender: Any) {
        // 弹出ActionSheetDialog
        let alertController = UIAlertController(title: "温馨提示", message: "您要进行的操作是？", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "复制", style: .default, handler: { (_: UIAlertAction) in
            print("点击了复制按钮")
        }))
        alertController.addAction(UIAlertAction(title: "修改", style: .default, handler: { (_: UIAlertAction) in
            print("点击了修改按钮")
        }))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("点击了取消按钮")
        }))
        self.present(alertController, animated: true, completion: {
            print("弹出ActionSheetDialog完成")
        })
    }
}
