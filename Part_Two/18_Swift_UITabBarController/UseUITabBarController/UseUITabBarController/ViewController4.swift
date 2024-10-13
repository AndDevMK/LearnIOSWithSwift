//
//  ViewController4.swift
//  UseUITabBarController
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController4: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 4)
        self.tabBarItem.title = "个人中心"
        self.tabBarItem.badgeColor = UIColor.red
        self.tabBarItem.badgeValue = "99+"
        self.view.backgroundColor = UIColor.white
    }
}
