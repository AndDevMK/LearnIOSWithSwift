//
//  WaterFallLayout.swift
//  UseUICollectionView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class WaterFallLayout: UICollectionViewFlowLayout {
    // item个数
    let itemCount: Int

    // 每个Item的布局信息
    var attriArray: [UICollectionViewLayoutAttributes] = []

    init(itemCount: Int) {
        self.itemCount = itemCount
        super.init()
    }

    required init?(coder: NSCoder) {
        self.itemCount = 0
        super.init(coder: coder)
    }

    /*
        用来进行布局准备工作，开发者可以在这个方法中进行自定义布局的配置
     */
    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical
        // 先计算每个Item的宽度，默认为2列布局
        let width = (UIScreen.main.bounds.size.width - self.minimumInteritemSpacing) / 2
        // 定义一个元组表示每一列的动态高度
        var columnHeight: (first: Int, second: Int) = (0, 0)
        for index in 0 ..< self.itemCount {
            // 默认设置一个组
            let indexPath = IndexPath(item: index, section: 0)
            // 布局属性类
            let attri = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            // 随机Item高度40~190
            let height = Int.random(in: 40 ... 190)
            // 标记放到哪一列（哪一列高度小，就把它放到哪一列下面）
            var flagColumn = 0
            if columnHeight.first <= columnHeight.second {
                columnHeight.first += (height + Int(self.minimumLineSpacing))
                flagColumn = 0
            } else {
                columnHeight.second += (height + Int(self.minimumLineSpacing))
                flagColumn = 1
            }
            // Item的位置y
            let offsetY = flagColumn == 0 ? columnHeight.first - height : columnHeight.second - height
            // 设置Item位置
            attri.frame = CGRect(x: Int(self.minimumInteritemSpacing + width) * flagColumn, y: offsetY, width: Int(width), height: height)
            self.attriArray.append(attri)
        }

        // 以最大一列高度作为计算每个item平均高度的中间值，可以保证滑动范围的正确性（Why？总之不设置列表滑动不了，这样的话猜测该值可能是为了测量列表尺寸）
        if columnHeight.first <= columnHeight.second {
            self.itemSize = CGSize(width: width, height: CGFloat(columnHeight.second * 2 / self.itemCount) - self.minimumLineSpacing)
        } else {
            self.itemSize = CGSize(width: width, height: CGFloat(columnHeight.first * 2 / self.itemCount) - self.minimumLineSpacing)
        }
    }

    /*
        布局信息数组
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attriArray
    }
}
