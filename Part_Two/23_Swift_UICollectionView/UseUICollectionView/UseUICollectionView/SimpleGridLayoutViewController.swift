//
//  GridLayoutItemsOfEqualSizeViewController.swift
//  UseUICollectionView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class SimpleGridLayoutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
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

    var scrollDirectionButton: UIButton?
    var flowLayout: UICollectionViewFlowLayout?
    var currentScrollDirection: UICollectionView.ScrollDirection = .vertical

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white

        let tooBar = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        tooBar.backgroundColor = UIColor.systemGray
        view.addSubview(tooBar)

        scrollDirectionButton = UIButton(type: .system)
        scrollDirectionButton?.setTitle("水平方向", for: .normal)
        scrollDirectionButton?.setTitleColor(UIColor.white, for: .normal)
        scrollDirectionButton?.backgroundColor = UIColor.systemBlue
        scrollDirectionButton?.frame = CGRect(x: 20, y: 5, width: 100, height: 40)
        scrollDirectionButton?.addTarget(self, action: #selector(onToggleScrollDirection), for: .touchUpInside)
        tooBar.addSubview(scrollDirectionButton!)

        // 集合视图布局类
        flowLayout = UICollectionViewFlowLayout()
        // 布局方向
        flowLayout?.scrollDirection = .vertical
        // 数据载体的尺寸
        flowLayout?.itemSize = CGSize(width: (view.frame.size.width - 20 * 4) / 3, height: (view.frame.size.width - 20 * 4) / 3)

        // 集合视图
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 50 + 20, width: view.frame.size.width - 20 * 2, height: view.frame.size.height - 50 - 20 * 2),
                                              collectionViewLayout: flowLayout!)
        // 设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        // 注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        view.addSubview(collectionView)
    }

    @objc func onToggleScrollDirection() {
        if currentScrollDirection == .vertical {
            currentScrollDirection = .horizontal
        } else {
            currentScrollDirection = .vertical
        }
        flowLayout?.scrollDirection = currentScrollDirection
        scrollDirectionButton?.setTitle(currentScrollDirection == .vertical ? "水平方向" : "垂直方向", for: .normal)
    }
}
