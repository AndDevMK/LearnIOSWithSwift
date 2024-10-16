//
//  GifAnimationByUIImageViewViewController.swift
//  UseGIFAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import ImageIO
import UIKit

class GifAnimationByUIImageViewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let imageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 100, height: 100))
        self.view.addSubview(imageView)
        self.playGIfOnImageView(name: "image", imageView: imageView)
    }

    func playGIfOnImageView(name: String, imageView: UIImageView) {
        // gif路径
        if let gifPath = Bundle.main.path(forResource: name, ofType: "gif") {
            // 通过gif路径创建URL
            let url = URL(fileURLWithPath: gifPath)
            // 创建gif实例
            let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil)
            // 获取gif图片张数
            let count = CGImageSourceGetCount(imageSource!)
            // 创建存放所有图片的数组
            var images: [UIImage] = []
            // 创建存放所有图片的宽高
            var imageWidthArr: [Int] = []
            var imageHeightArr: [Int] = []
            // 存放gif播放时长
            var duration = Double()
            for i in 0 ..< count {
                // 从gif实例中获取图片
                let image = CGImageSourceCreateImageAtIndex(imageSource!, i, nil)
                images.append(UIImage(cgImage: image!))

                // 获取图片信息数组
                if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource!, i, nil) as? [String: Any] {
                    // 获取图片的宽高
                    if let imageWidth = imageProperties[kCGImagePropertyPixelWidth as String] as? Int {
                        imageWidthArr.append(imageWidth)
                    }
                    if let imageHeight = imageProperties[kCGImagePropertyPixelHeight as String] as? Int {
                        imageHeightArr.append(imageHeight)
                    }
                    // 获取时间信息
                    if let GIFDictionary = imageProperties[kCGImagePropertyGIFDictionary as String] as? [String: Any] {
                        // 进行时间累加
                        if let delayTime = GIFDictionary[kCGImagePropertyGIFDelayTime as String] as? Double {
                            duration += delayTime
                        }
                    }
                }
            }
            // 重设ImageView尺寸为gif图片尺寸（由于大部分gif文件中的图片尺寸相同，这里随便取一个即可）
            imageView.frame = CGRect(x: 20, y: 100, width: imageWidthArr.isEmpty ? 200 : imageWidthArr[0], height: imageHeightArr.isEmpty ? 200 : imageHeightArr[0])
            // 播放gif动画
            imageView.animationImages = images
            imageView.animationDuration = duration
            imageView.animationRepeatCount = 0
            imageView.startAnimating()
        }
    }
}
