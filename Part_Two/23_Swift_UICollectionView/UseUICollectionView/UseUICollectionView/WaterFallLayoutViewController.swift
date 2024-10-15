//
//  WaterFallLayoutViewController.swift
//  UseUICollectionView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class WaterFallLayoutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    /*
        分组数量
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    /*
        每个组的Item个数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    /*
        每个组具体的数据载体Item
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.systemBlue
        return cell
    }

    /*
        点击事件
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("第\(indexPath.row)个Item被点击")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let waterFallLayout = WaterFallLayout(itemCount: 30)

        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: waterFallLayout)
        // 设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        // 注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        view.addSubview(collectionView)
    }
}
