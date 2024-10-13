//
//  TableViewController.swift
//  UseUINavigationController
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RootViewController"

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 0, width: 200, height: 40)
        let attri = NSAttributedString(string: "切换ViewController",
                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attri, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(onToggleViewController), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func onToggleViewController() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}
