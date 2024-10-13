//
//  ViewController.swift
//  UseUITabBarController
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        self.tabBarItem.title = "首页"
        self.view.backgroundColor = UIColor.white
    }
}
