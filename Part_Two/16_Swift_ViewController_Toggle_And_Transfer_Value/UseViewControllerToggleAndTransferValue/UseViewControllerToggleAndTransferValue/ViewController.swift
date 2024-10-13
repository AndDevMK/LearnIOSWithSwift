//
//  ViewController.swift
//  UseViewControllerToggleAndTransferValue
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController: UIViewController, ViewController2Protocol {
    /*
      反向传值方式一之通过协议传值
     */
    var label1: UILabel?
    func setData(data: String?) {
        if let value = data {
            self.label1?.text = "接收协议反向传值数据：" + value
        } else {
            self.label1?.text = "接收协议反向传值数据：nil"
        }
    }

    /*
      反向传值方式一之通过闭包传值
     */
    var label2: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.label1 = UILabel(frame: CGRect(x: 20, y: 225, width: self.view.frame.width - 20 - 20, height: 50))
        self.label1?.textColor = UIColor.black
        self.label1?.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(self.label1!)

        self.label2 = UILabel(frame: CGRect(x: 20, y: 275, width: self.view.frame.width - 20 - 20, height: 50))
        self.label2?.textColor = UIColor.black
        self.label2?.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(self.label2!)
    }

    @IBAction func onToggleViewController2(_ sender: Any) {
        // 切换到ViewController2
        self.present(ViewController2(), animated: true, completion: {
            print("跳转ViewController2成功")
        })
    }

    @IBAction func onToggleViewController2WithArgs(_ sender: Any) {
        // 切换到ViewController2（正向传值之属性传值）
        let viewController = ViewController2()
        viewController.viewController2Protocol = self
        viewController.closure = { (data: String?) in
            if let value = data {
                self.label2?.text = "接收闭包反向传值数据：" + value
            } else {
                self.label2?.text = "接收闭包反向传值数据：nil"
            }
        }
        viewController.data = "888"
        self.present(viewController, animated: true, completion: {
            print("跳转ViewController2成功")
        })
    }

    @IBAction func onToggleViewController2WithArgsV2(_ sender: Any) {
        // 切换到ViewController2（正向传值之构造方法传值）
        let viewController = ViewController2(data2: "999")
        viewController.viewController2Protocol = self
        viewController.closure = { (data: String?) in
            if let value = data {
                self.label2?.text = "接收闭包反向传值数据：" + value
            } else {
                self.label2?.text = "接收闭包反向传值数据：nil"
            }
        }
        self.present(viewController, animated: true, completion: {
            print("跳转ViewController2成功")
        })
    }
}
