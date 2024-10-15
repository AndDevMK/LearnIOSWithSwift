//
//  SimpleListViewController.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class SimpleListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        // 初始化数据
        for i in 0 ..< 30 {
            self.datas.append(String(i))
        }

        // .plain为扁平化风格
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        // 注册Cell
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        // 设置数据源与代理
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
}
