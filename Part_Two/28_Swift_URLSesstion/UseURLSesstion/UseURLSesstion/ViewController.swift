//
//  ViewController.swift
//  UseURLSesstion
//
//  Created by 彭明健 on 2024/10/18.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onDoGetRequest(_ sender: Any) {
        let url = URL(string: "https://www.wanandroid.com/banner/json")
        let request = URLRequest(url: url!)
        /*
         URLSessionConfiguration类型
             /*
                  default属性：默认类型的请求
                  ephemeral属性：即时类型的请求
                  background()方法：后台运行类型的请求
              */
         */
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: { data, _, _ in
            if let map = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                print("解析数据为：\(map)")
            } else {
                print("解析数据失败")
            }
        })
        task.resume()
    }

    @IBAction func onDoPostRequest(_ sender: Any) {
        let page = 0, pageSize = 20, k = "Gson"

        let url = URL(string: "https://www.wanandroid.com/article/query/\(page)/json")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "k=\(k)&page_size=\(pageSize)".data(using: .utf8)
        /*
         URLSessionConfiguration类型
             /*
                  default属性：默认类型的请求
                  ephemeral属性：即时类型的请求
                  background()方法：后台运行类型的请求
              */
         */
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: { data, _, _ in
            if let map = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                print("解析数据为：\(map)")
            } else {
                print("解析数据失败")
            }
        })
        task.resume()
    }
}
