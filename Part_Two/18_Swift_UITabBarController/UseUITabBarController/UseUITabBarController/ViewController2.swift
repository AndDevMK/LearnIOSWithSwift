//
//  ViewController2.swift
//  UseUITabBarController
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        self.tabBarItem.title = "直播"
        self.view.backgroundColor = UIColor.white
    }
}
