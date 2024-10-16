//
//  ViewController.swift
//  UseCoreAnimation
//
//  Created by 彭明健 on 2024/10/16.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCAGradientLayer(_ sender: Any) {
        present(CAGradientLayerViewController(), animated: true, completion: {
            print("切换CAGradientLayerViewController完成")
        })
    }

    @IBAction func onCAReplicatorLayer(_ sender: Any) {
        present(CAReplicatorLayerViewController(), animated: true, completion: {
            print("切换CAReplicatorLayerViewController完成")
        })
    }

    @IBAction func onCAShapeLayer(_ sender: Any) {
        present(CAShapeLayerViewController(), animated: true, completion: {
            print("切换CAShapeLayerViewController完成")
        })
    }

    @IBAction func onCAEmitterLayer(_ sender: Any) {
        present(CAEmitterLayerViewController(), animated: true, completion: {
            print("切换CAEmitterLayerViewController完成")
        })
    }
    
    @IBAction func onCABasicAnimation(_ sender: Any) {
        present(CABasicAnimationViewController(), animated: true, completion: {
            print("切换CABasicAnimationViewController完成")
        })
    }

    @IBAction func onCAKeyframeAnimation(_ sender: Any) {
        present(CAKeyframeAnimationViewController(), animated: true, completion: {
            print("切换CAKeyframeAnimationViewController完成")
        })
    }

    @IBAction func onCASpringAnimation(_ sender: Any) {
        present(CASpringAnimationViewController(), animated: true, completion: {
            print("切换CASpringAnimationViewController完成")
        })
    }

    @IBAction func onCATransition(_ sender: Any) {
        present(CATransitionViewController(), animated: true, completion: {
            print("切换CATransitionViewController完成")
        })
    }

    @IBAction func onCAAnimationGroup(_ sender: Any) {
        present(CAAnimationGroupViewController(), animated: true, completion: {
            print("切换CAAnimationGroupViewController完成")
        })
    }
}
