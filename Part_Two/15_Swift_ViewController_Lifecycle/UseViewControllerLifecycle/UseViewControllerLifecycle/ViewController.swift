//
//  ViewController.swift
//  UseViewControllerLifecycle
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController: UIViewController {
    /*
      在UIViewController实例被创建时调用，用于其中视图的构造加载
     */
    override func loadView() {
        print("加载视图回调")
    }

    /*
       视图控制器中的视图已经加载完成，开发者通常会在这个方法中进行自定义视图的加载。
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("加载视图完成回调")
    }

    /*
      viewWillLayoutSubviews与viewDidLayoutSubviews：在视图控制器对其内部的子视图进行布局时调用
     */
    override func viewWillLayoutSubviews() {
        print("将要布局子视图回调")
    }

    override func viewDidLayoutSubviews() {
        print("已经布局子视图回调")
    }

    /*
      viewWillAppear与viewDidAppear：当视图控制器上的视图展示在屏幕上才会被调用
     */
    override func viewWillAppear(_ animated: Bool) {
        print("界面将要展现回调")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("界面已经展现回调")
    }

    /*
       viewWillDisappear与viewDidDisappear：视图控制器上的视图从屏幕上消失时调用，这两个方法的调用并不一定代表视图控制器实例将会被释放。
     */
    override func viewWillDisappear(_ animated: Bool) {
        print("界面将要消失回调")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("界面已经消失回调")
    }

    /*
      视图控制器实例完全被释放了
     */
    deinit {
        print("析构方法")
    }

    /*
      随着iOS设备内存性能逐渐强大，这个函数的应用已经不多，如果要适配低性能的iOS设备，读者可以在这个函数中对无用数据进行销毁及释放操作
     */
    override func didReceiveMemoryWarning() {
        print("收到内存警告回调")
    }
}
