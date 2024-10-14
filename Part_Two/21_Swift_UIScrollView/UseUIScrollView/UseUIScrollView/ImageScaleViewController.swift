//
//  ImageScaleViewController.swift
//  UseUIScrollView
//
//  Created by 彭明健 on 2024/10/14.
//

import UIKit

class ImageScaleViewController: UIViewController, UIScrollViewDelegate {
    var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let scrollView = UIScrollView(frame: self.view.frame)
        self.view.addSubview(scrollView)

        scrollView.delegate = self

        self.imageView = UIImageView(image: UIImage(named: "image"))
        self.imageView?.frame = self.view.frame
        scrollView.addSubview(self.imageView!)

        scrollView.contentSize = self.view.frame.size

        // 缩放限度
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
    }

    /*
        返回进行缩放操作的子视图
     */
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
