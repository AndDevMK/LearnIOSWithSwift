//
//  EditModeViewController.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class EditModeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
        每行的编辑模式
     */
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return self.isEdit ?(indexPath.row == 0 ? .insert : .delete) : .none
    }

    /*
        编辑模式下，显示插入或删除按钮的文字
     */
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return indexPath.row == 0 ? "插入" : "删除"
    }

    /*
        编辑模式下，点击插入或删除按钮的回调
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            self.datas.insert(String(Int.random(in: 100 ... 200)), at: 1)
            // 插入到索引为1的位置，只有一个组，所以section为0
            tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .fade)
        } else if editingStyle == .delete {
            self.datas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }

    /*
        行之间交换位置（实现该协议方法后，在编辑模式下，item后面多出一个拖拽排序按钮）
     */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = self.datas[sourceIndexPath.row]
        let dest = self.datas[destinationIndexPath.row]
        self.datas[sourceIndexPath.row] = dest
        self.datas[destinationIndexPath.row] = source
    }

    var isEdit: Bool = false
    var editButton: UIButton?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white

        let toolBar = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        toolBar.backgroundColor = UIColor.systemGray
        self.view.addSubview(toolBar)

        self.editButton = UIButton(type: .system)
        self.editButton?.frame = CGRect(x: 20, y: 5, width: 100, height: 40)
        self.editButton?.setTitle("编辑", for: .normal)
        self.editButton?.setTitleColor(UIColor.white, for: .normal)
        self.editButton?.backgroundColor = UIColor.systemBlue
        self.editButton?.addTarget(self, action: #selector(self.onClickEdit), for: .touchUpInside)
        toolBar.addSubview(self.editButton!)

        // 初始化数据
        for i in 0 ..< 30 {
            self.datas.append(String(i))
        }

        // .plain为扁平化风格
        self.tableView = UITableView(
            frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: self.view.frame.size.height - 50),
            style: .plain
        )
        // 注册Cell
        self.tableView?.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        // 设置数据源与代理
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.view.addSubview(self.tableView!)
    }

    @objc func onClickEdit() {
        self.isEdit.toggle()
        // 编辑模式
        self.tableView?.isEditing = self.isEdit
        self.editButton?.setTitle(self.isEdit ? "完成" : "编辑", for: .normal)
    }
}
