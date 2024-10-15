//
//  GridLayoutItemsOfUnEqualSizeViewController.swift
//  UseUICollectionView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class FlexibleGridLayoutViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
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

    /*
        动态设置每个Item的尺寸
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 2 == 0 {
            return CGSize(width: 50, height: 50)
        } else {
            return CGSize(width: 100, height: 100)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        // 集合视图布局类
        let flowLayout = UICollectionViewFlowLayout()
        // 布局方向
        flowLayout.scrollDirection = .vertical
        // 分组最小行间距
        flowLayout.minimumLineSpacing = 20
        // 分组最小列间距
        flowLayout.minimumInteritemSpacing = 20
        // 分组头视图尺寸
        flowLayout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 200)
        // 分组尾视图尺寸
        flowLayout.footerReferenceSize = CGSize(width: self.view.frame.size.width, height: 200)
        // 分组边距
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        // 集合视图
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        // 设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        // 注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        view.addSubview(collectionView)
    }
}
