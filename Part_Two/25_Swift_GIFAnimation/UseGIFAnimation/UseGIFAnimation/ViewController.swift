//
//  ViewController.swift
//  UseGIFAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onGifAnimationByUIImageView(_ sender: Any) {
        present(GifAnimationByUIImageViewViewController(), animated: true, completion: {
            print("切换GifAnimationByUIImageViewViewController完成")
        })
    }

    @IBAction func onGifAnimationByUIWebView(_ sender: Any) {
        present(GifAnimationByUIWebViewViewController(), animated: true, completion: {
            print("切换GifAnimationByUIWebViewViewController完成")
        })
    }
}
