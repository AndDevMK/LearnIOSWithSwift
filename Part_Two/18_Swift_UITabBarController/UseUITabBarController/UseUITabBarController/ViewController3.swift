//
//  ViewController3.swift
//  UseUITabBarController
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
        self.tabBarItem.title = "推荐"
        self.view.backgroundColor = UIColor.white
    }
}
