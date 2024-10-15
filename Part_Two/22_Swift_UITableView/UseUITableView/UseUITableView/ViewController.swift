//
//  ViewController.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSimpleList(_ sender: Any) {
        present(SimpleListViewController(), animated: true, completion: {
            print("切换SimpleListViewController完成")
        })
    }

    @IBAction func onGroupedList(_ sender: Any) {
        present(GroupedListViewController(), animated: true, completion: {
            print("切换GroupedListViewController完成")
        })
    }

    @IBAction func onCustomTableViewCellList(_ sender: Any) {
        present(CustomTableViewCellListViewController(), animated: true, completion: {
            print("切换CustomTableViewCellListViewController完成")
        })
    }

    @IBAction func OnEditModeList(_ sender: Any) {
        present(EditModeListViewController(), animated: true, completion: {
            print("切换EditModeListViewController完成")
        })
    }

    @IBAction func onContactIndexedList(_ sender: Any) {
        present(ContactIndexedListViewController(), animated: true, completion: {
            print("切换ContactIndexedListViewController完成")
        })
    }
}
