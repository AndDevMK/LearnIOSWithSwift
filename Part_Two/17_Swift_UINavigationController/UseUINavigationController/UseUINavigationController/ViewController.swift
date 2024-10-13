//
//  ViewController.swift
//  UseUINavigationController
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "ViewController"
        self.view.backgroundColor = UIColor.white

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 100, width: 100, height: 40)
        let attri = NSAttributedString(string: "返回",
                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attri, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(self.onBackPressed), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func onBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
