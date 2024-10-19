//
//  ViewController.swift
//  Uselibsqlite3
//
//  Created by 彭明健 on 2024/10/19.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCreateTable(_ sender: Any) {
        OC_SqliteImpl.runNormalSql("create table if not exists User(id integer primary key autoincrement, name text, age integer)")
    }

    @IBAction func onDropTable(_ sender: Any) {
        OC_SqliteImpl.runNormalSql("drop table User")
    }
    
    @IBAction func onInsertOne(_ sender: Any) {
        OC_SqliteImpl.runNormalSql("insert into User(name, age) values(\"MinKin\", 28)")
    }

    @IBAction func onQueryAll(_ sender: Any) {
        OC_SqliteImpl.selectSql()
    }

    @IBAction func onUpdateOne(_ sender: Any) {
        OC_SqliteImpl.runNormalSql("update User set age=30 where name=\"MinKin\"")
    }

    @IBAction func onDeleteOne(_ sender: Any) {
        OC_SqliteImpl.runNormalSql("delete from User where name=\"MinKin\"")
    }

}
