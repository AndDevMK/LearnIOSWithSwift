//
//  ViewController2.swift
//  UseViewControllerToggleAndTransferValue
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController2: UIViewController {
    /*
      正向传值方式一：通过属性传值
     */
    var data: String?

    /*
      正向传值方式二：通过构造方法传值
     */
    var data2: String?

    init(data2: String? = nil) {
        self.data2 = data2
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let label1 = UILabel(frame: CGRect(x: 20, y: 50, width: self.view.frame.width - 20 - 20, height: 40))
        label1.textColor = UIColor.black
        label1.font = UIFont.systemFont(ofSize: 20)
        if let value = data {
            label1.text = "接收属性正向传值数据：" + value
        } else {
            label1.text = "接收属性正向传值数据：nil"
        }
        self.view.addSubview(label1)

        let label2 = UILabel(frame: CGRect(x: 20, y: 100, width: self.view.frame.width - 20 - 20, height: 40))
        label2.textColor = UIColor.black
        label2.font = UIFont.systemFont(ofSize: 20)
        if let value = data2 {
            label2.text = "接收构造方法正向传值数据：" + value
        } else {
            label2.text = "接收构造方法正向传值数据：nil"
        }
        self.view.addSubview(label2)

        let button1 = UIButton(frame: CGRect(x: 20, y: 160, width: 100, height: 50))
        button1.setTitle("返回", for: .normal)
        button1.backgroundColor = UIColor.blue
        button1.addTarget(self, action: #selector(self.onBackPressed), for: .touchUpInside)
        self.view.addSubview(button1)

        let button2 = UIButton(frame: CGRect(x: 20, y: 240, width: 250, height: 50))
        button2.setTitle("返回（反向传值之协议传值）", for: .normal)
        button2.backgroundColor = UIColor.blue
        button2.addTarget(self, action: #selector(self.onBackPressedV2), for: .touchUpInside)
        self.view.addSubview(button2)

        let button3 = UIButton(frame: CGRect(x: 20, y: 320, width: 250, height: 50))
        button3.setTitle("返回（反向传值之闭包传值）", for: .normal)
        button3.backgroundColor = UIColor.blue
        button3.addTarget(self, action: #selector(self.onBackPressedV3), for: .touchUpInside)
        self.view.addSubview(button3)
    }

    @objc func onBackPressed() {
        self.dismiss(animated: true, completion: {
            print("返回ViewController成功")
        })
    }

    /*
      反向传值方式一之通过协议传值
     */
    var viewController2Protocol: ViewController2Protocol?

    @objc func onBackPressedV2() {
        self.viewController2Protocol?.setData(data: "666")
        self.dismiss(animated: true, completion: {
            print("返回ViewController成功")
        })
    }

    /*
      反向传值方式二之通过闭包传值
     */
    var closure: ((String?) -> Void)?

    @objc func onBackPressedV3() {
        if let call = self.closure {
            call("333")
        }
        self.dismiss(animated: true, completion: {
            print("返回ViewController成功")
        })
    }
}

/*
  反向传值方式一之通过协议传值
 */
protocol ViewController2Protocol {
    func setData(data: String?)
}
