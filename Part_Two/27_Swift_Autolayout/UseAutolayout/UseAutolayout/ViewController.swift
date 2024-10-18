//
//  ViewController.swift
//  UseAutolayout
//
//  Created by 彭明健 on 2024/10/17.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onStoryboardOrXIBAutoLayout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StoryboardOrXIBAutoLayout", bundle: nil)
        // 通过storyboard配置ID的方式
//        if let viewController = storyboard.instantiateViewController(withIdentifier: "StoryboardOrXIBAutoLayout") as? StoryboardOrXIBAutoLayoutViewController {
//            self.present(viewController, animated: true, completion: {
//                print("切换StoryboardOrXIBAutoLayoutViewController完成")
//            })
//        }

        // 通过storyboard勾选is initial View Controller方式
        if let viewController = storyboard.instantiateInitialViewController() as? StoryboardOrXIBAutoLayoutViewController {
            self.present(viewController, animated: true, completion: {
                print("切换StoryboardOrXIBAutoLayoutViewController完成")
            })
        }
    }

    @IBAction func onDoAutoLayoutOnViews(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DoAutoLayoutOnViews", bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? DoAutoLayoutOnViewsViewController {
            self.present(viewController, animated: true, completion: {
                print("切换DoAutoLayoutOnViewsViewController完成")
            })
        }
    }

    @IBAction func onAutoLayoutByCode(_ sender: Any) {
        self.present(AutoLayoutByCodeViewController(), animated: true, completion: {
            print("切换AutoLayoutByCodeViewController完成")
        })
    }

    @IBAction func onVFLConstraint(_ sender: Any) {
        self.present(VFLConstraintViewController(), animated: true, completion: {
            print("切换VFLConstraintViewController完成")
        })
    }

    @IBAction func onAutoLayoutBySnapKit(_ sender: Any) {
        self.present(AutoLayoutBySnapKitViewController(), animated: true, completion: {
            print("切换AutoLayoutBySnapKitViewController完成")
        })
    }

    @IBAction func onAutoHeightTextView(_ sender: Any) {
        self.present(AutoHeightTextViewViewController(), animated: true, completion: {
            print("切换AutoHeightTextViewViewController完成")
        })
    }
}
