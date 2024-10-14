//
//  ViewController.swift
//  UseUIScrollView
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onVerticalScroll(_ sender: Any) {
        present(VerticalScrollViewController(), animated: true, completion: {
            print("切换VerticalScrollViewController完成")
        })
    }

    @IBAction func onHorizontalScroll(_ sender: Any) {
        present(HorizontalScrollViewController(), animated: true, completion: {
            print("切换HorizontalScrollViewController完成")
        })
    }

    @IBAction func onImageScale(_ sender: Any) {
        present(ImageScaleViewController(), animated: true, completion: {
            print("切换ImageScaleViewController完成")
        })
    }
}
