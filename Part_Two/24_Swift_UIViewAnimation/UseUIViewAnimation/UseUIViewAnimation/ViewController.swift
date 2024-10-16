//
//  ViewController.swift
//  UseUIViewAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onUIViewPropertyAnimation(_ sender: Any) {
        present(UIVIewPropertyAnimationViewController(), animated: true, completion: {
            print("切换UIVIewPropertyAnimationViewController成功")
        })
    }

    @IBAction func onUIViewTransitionAnimation(_ sender: Any) {
        present(UIViewTransitionAnimationViewController(), animated: true, completion: {
            print("切换UIViewTransitionAnimationViewController成功")
        })
    }
}
