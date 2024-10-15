//
//  ViewController.swift
//  UseUICollectionView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSimpleGridLayout(_ sender: Any) {
        present(SimpleGridLayoutViewController(), animated: true, completion: {
            print("切换SimpleGridLayoutViewController完成")
        })
    }

    @IBAction func onFlexibleGridLayout(_ sender: Any) {
        present(FlexibleGridLayoutViewController(), animated: true, completion: {
            print("切换FlexibleGridLayoutViewController完成")
        })
    }

    @IBAction func onWaterFallLayout(_ sender: Any) {
        present(WaterFallLayoutViewController(), animated: true, completion: {
            print("切换WaterFallLayoutViewController完成")
        })
    }
}
