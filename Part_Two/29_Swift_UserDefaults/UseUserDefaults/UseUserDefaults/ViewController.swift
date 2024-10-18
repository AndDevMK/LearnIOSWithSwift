//
//  ViewController.swift
//  UseUserDefaults
//
//  Created by 彭明健 on 2024/10/18.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onWriteDataByUserDefaults(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(URL(string: "https://www.baidu.com"), forKey: "URLData")
        userDefaults.set("字符串数据", forKey: "StringData")
        userDefaults.set(true, forKey: "BoolData")
        userDefaults.set(Double.pi, forKey: "DoubleData")
        userDefaults.set(Float.pi, forKey: "FloatData")
        userDefaults.set(88, forKey: "IntData")
        userDefaults.set(["name": "MinKin", "age": 28], forKey: "DictionaryData")
        userDefaults.set([1, 2, 3, 4], forKey: "ArrayData")
        userDefaults.set(Data(), forKey: "DataData")
        // 将操作同步
        userDefaults.synchronize()
    }

    @IBAction func onReadDataByUserDefaults(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        if let URLData = userDefaults.url(forKey: "URLData") {
            print(URLData)
        }
        if let StringData = userDefaults.string(forKey: "StringData") {
            print(StringData)
        }
        print(userDefaults.bool(forKey: "BoolData"))
        print(userDefaults.double(forKey: "DoubleData"))
        print(userDefaults.float(forKey: "FloatData"))
        print(userDefaults.integer(forKey: "IntData"))
        if let DictionaryData = userDefaults.dictionary(forKey: "DictionaryData") {
            print(DictionaryData)
        }
        if let ArrayData = userDefaults.array(forKey: "ArrayData") {
            print(ArrayData)
        }
        if let DataData = userDefaults.data(forKey: "DataData") {
            print(DataData)
        }
    }

    @IBAction func onRemoveOneDataByUserDefaults(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "URLData")
    }

    @IBAction func onReadDataByPlist(_ sender: Any) {
        let path = Bundle.main.path(forResource: "XPropertyList", ofType: "plist")
        // 将文件内容读成字典
        if let map = NSDictionary(contentsOfFile: path!) {
            print("解析成功：\(map)")
        } else {
            print("解析失败")
        }
    }

    @IBAction func onCreatePlistForWriteData(_ sender: Any) {
        // 获取沙盒的用户数据目录
        if let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let filePath = dir + "/XProperty.plist"
            let dic: NSDictionary = ["name": "MinKin", "age": 28]
            // 创建文件并写入
            dic.write(toFile: filePath, atomically: true)
        }
    }

    @IBAction func onCreatePlistForReadData(_ sender: Any) {
        // 获取沙盒的用户数据目录
        if let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let filePath = dir + "/XProperty.plist"
            // 将文件内容读成字典
            if let map = NSDictionary(contentsOfFile: filePath) {
                print("解析成功：\(map)")
            } else {
                print("解析失败")
            }
        }
    }
}
