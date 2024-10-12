//
//  ViewController.swift
//  UseUIImageView
//
//  Created by 彭明健 on 2024/10/12.
//

import UIKit

class ViewController: UIViewController {
    var imageView2: UIImageView? = nil
    // 存放关键帧图片
    var uiImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        /**
           显示一张图片
         */
        let image1 = UIImage(named: "image")?.withRenderingMode(.alwaysOriginal)
        let imageView1 = UIImageView(image: image1)
        imageView1.frame = CGRect(x: 0, y: 50, width: 150, height: 200)
        // 图片拉伸至控件大小，会变形
        imageView1.contentMode = .scaleToFill
        view.addSubview(imageView1)

        /**
           播放关键帧图片
         */
        for i in 1 ... 8 {
            uiImages.append(UIImage(named: "bird\(i)")!)
        }
        imageView2 = UIImageView(frame: CGRect(x: 0, y: 300, width: 200, height: 100))
        imageView2?.contentMode = .scaleToFill
        imageView2?.animationImages = uiImages
        imageView2?.animationDuration = 0.8
        imageView2?.animationRepeatCount = 0
        // 点击事件
        imageView2?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClick)))
        imageView2?.isUserInteractionEnabled = true
        view.addSubview(imageView2!)
        imageView2!.startAnimating()
    }

    var startAnimating: Bool = true

    @objc func onClick() {
        if startAnimating {
            imageView2?.stopAnimating()
            // 动画停止后，图片消失，修改为显示第一张图片
            imageView2?.image = uiImages[0]
        } else {
            imageView2?.startAnimating()
        }
        startAnimating.toggle()
    }
}
