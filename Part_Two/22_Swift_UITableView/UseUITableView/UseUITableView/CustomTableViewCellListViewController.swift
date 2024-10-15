//
//  CustomDataClassCellListViewController.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class CustomTableViewCellListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var datas: [Product] = []

    /*
        列表有多少行
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }

    /*
        每行数据载体Cell视图
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! ProductTableViewCell
        let product: Product = self.datas[indexPath.row]
        cell.coverImageView.image = UIImage(named: product.imagePath ?? "")
        cell.titleLabel.text = product.title ?? ""
        cell.subTitleLabel.text = product.subTitle ?? ""
        cell.priceLabel.text = product.price ?? ""
        cell.saleCountLabel.text = product.saleCount ?? ""
        return cell
    }

    /*
        每一行高度
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 初始化数据
        for i in 0 ..< 10 {
            let product = Product()
            product.imagePath = "image"
            product.title = "vivo X200 Pro 16GB+1TB 白月光 卫星通信版"
            product.subTitle = "【全款预售，10月19日9点开售】 蓝晶×天玑 9400|6000mAh蓝海电池|蔡司2 亿APO超级长焦"
            product.price = "￥ 6799.00"
            product.saleCount = "已售\(i)"
            self.datas.append(product)
        }

        // .plain为扁平化风格
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        // 注册Cell
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        // 设置数据源与代理
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}
