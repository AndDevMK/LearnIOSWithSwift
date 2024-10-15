//
//  ContactIndexedListViewController.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class ContactIndexedListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 数据源
    var datas: [String: [String]] = [:]

    // 索引栏标题列表
    var indexDatas: [String] = ["#", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    /*
        列表有多少行
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let indexStr = self.indexDatas[section]
        return self.datas[indexStr]?.count ?? 0
    }

    /*
        每行数据载体Cell视图
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        let indexStr = self.indexDatas[indexPath.section]
        cell.textLabel?.text = self.datas[indexStr]?[indexPath.row] ?? ""
        return cell
    }

    /*
        分组数
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.indexDatas.count
    }

    /*
        索引栏标题列表
     */
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.indexDatas
    }

    /*
        分组头部标题
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.indexDatas[section]
    }

    /*
        自定义分组头部（优先级比“分组头部标题”高）
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        header.backgroundColor = UIColor.systemGray
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.size.width - 20 * 2, height: 50))
        label.text = self.indexDatas[section]
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        header.addSubview(label)
        return header
    }

    /*
        分组头部高度
     */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    /*
        将索引栏文字与具体的分组关联。一般情况下，索引栏上的标题顺序与列表中的分区顺序是一一对应的，开发者不需要做特殊处理，直接返回传递进来的index即可。
     */
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 初始化数据
        for indexStr in self.indexDatas {
            var tempArr: [String] = []
            for i in 0 ..< 3 {
                tempArr.append("\(indexStr)\(i)")
            }
            self.datas[indexStr] = tempArr
        }

        // .grouped为分组风格
        let tableView = UITableView(frame: self.view.frame, style: .grouped)
        // 注册Cell
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        // 设置数据源与代理
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}
