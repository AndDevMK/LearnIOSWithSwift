//
//  ViewController.swift
//  UseUISearchBar
//
//  Created by 彭明健 on 2024/10/13.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50))
        // 迷你风格（用于日历，音乐等应用中的搜索栏风格）
        searchBar.searchBarStyle = .minimal
        // 背景颜色
        searchBar.backgroundColor = UIColor(white: 0, alpha: 0.05)
        // 风格颜色（光标、取消按钮颜色）
        searchBar.tintColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        // 提示文字
        searchBar.placeholder = "搜索"
        // 显示取消按钮
        searchBar.showsCancelButton = true
        // 软键盘返回键类型
        searchBar.returnKeyType = .search
        // 状态监听
        searchBar.delegate = self
        self.view.addSubview(searchBar)
    }

    /**
       开始编辑时回调，返回true允许进入编辑状态
     */
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("进入开始编辑状态")
        return true
    }

    /**
       已经进入编辑时回调
     */
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("已经进入编辑")
    }

    /**
       结束编辑时回调，返回true允许结束编辑状态
     */
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("进入结束编辑状态")
        return true
    }

    /**
       已经结束编辑时回调
     */
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("已经结束编辑")
    }

    /**
       搜索框文本发生变化时回调
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("输入内容为: \(searchText)")
    }

    /**
       搜索框文本将要发生变化时回调，返回true表示此次编辑有效
     */
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("搜索框文本将要发生变化")
        return true
    }

    /**
       点击键盘的搜索按钮
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("点击键盘的搜索按钮")
        searchBar.resignFirstResponder()
    }

    /**
       点击取消按钮
     */
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("点击取消按钮")
        searchBar.resignFirstResponder()
    }
}
