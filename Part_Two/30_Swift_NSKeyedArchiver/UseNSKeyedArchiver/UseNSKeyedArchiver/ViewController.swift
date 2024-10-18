//
//  ViewController.swift
//  UseNSKeyedArchiver
//
//  Created by 彭明健 on 2024/10/18.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onArchiverForSingleData(_ sender: Any) {
        // 获取根目录
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "Archiver.file"
        // 对字符串数据归档
        NSKeyedArchiver.archiveRootObject("MinKin", toFile: filePath)
    }

    @IBAction func onUnArchiverForSingleData(_ sender: Any) {
        // 获取根目录
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "Archiver.file"
        // 对字符串数据解归档
        if let name = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) {
            print(name)
        }
    }

    @IBAction func onArchiverForMultiData(_ sender: Any) {
        // 获取根目录
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "ArchiverV2.file"
        // 创建归档数据载体
        let mutableData = NSMutableData()
        // 创建归档对象
        let archiver = NSKeyedArchiver(forWritingWith: mutableData)
        // 进行数据编码
        archiver.encode("Jerry", forKey: "name")
        archiver.encode(28, forKey: "age")
        // 编码完成
        archiver.finishEncoding()
        // 将数据写入文件
        mutableData.write(toFile: filePath, atomically: true)
    }

    @IBAction func onUnArchiverForMultiData(_ sender: Any) {
        // 获取根目录
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "ArchiverV2.file"
        // 将文件读成Data数据
        if let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            // 创建解归档对象
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            // 对数据解归档
            let name = unarchiver.decodeObject(forKey: "name") ?? ""
            let age = unarchiver.decodeInteger(forKey: "age")
            print("name: \(name), age: \(age)")
        }
    }

    @IBAction func onArchiverForCustomData(_ sender: Any) {
        // 获取根目录
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "ArchiverV3.file"
        let user = User()
        user.name = "Tony"
        user.age = 30
        // 对自定义数据归档
        NSKeyedArchiver.archiveRootObject(user, toFile: filePath)
    }

    @IBAction func onUnArchiverForCustomData(_ sender: Any) {
        // 获取根目录
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "ArchiverV3.file"
        // 对自定义数据解归档
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? User {
            print("name: \(user.name ?? ""), age: \(user.age)")
        }
    }
}
