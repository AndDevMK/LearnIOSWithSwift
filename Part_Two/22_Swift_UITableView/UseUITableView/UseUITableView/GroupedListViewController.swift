//
//  GroupedListViewController.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class GroupedListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var datas: [String] = []

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        cell.textLabel?.text = self.datas[indexPath.row]
        return cell
    }

    /*
        分组数
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    /*
        分组头部标题
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "分组头部\(section)"
    }

    /*
        自定义分组头部（优先级比“分组头部标题”高）
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        header.backgroundColor = UIColor.systemGray
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.size.width - 20 * 2, height: 50))
        label.text = "分组头部\(section)"
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 初始化数据
        for i in 0 ..< 20 {
            self.datas.append(String(i))
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
