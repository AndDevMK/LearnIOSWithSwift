//
//  ViewController.swift
//  UseCoreData
//
//  Created by 彭明健 on 2024/10/19.
//

import CoreData
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupCoreDataStack()
    }

    var context: NSManagedObjectContext?

    /*
        初始化CoreData栈
     */
    func setupCoreDataStack() {
        // 获取数据模型文件地址
        let modelURL = Bundle.main.url(forResource: "UseCoreData", withExtension: "momd")!
        // 创建数据模型管理实例（数据模型管理类，其通过.xcdatamodeld来创建）
        guard let modelManager = NSManagedObjectModel(contentsOf: modelURL) else {
            print("Unable to initialize the modelManager from: \(modelURL)")
            return
        }
        // 创建存储管理实例（数据库与数据模型之间的链接类，其作用是将数据模型创建的数据映射为数据库中的数据）
        let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: modelManager)
        // 设置存储路径
        let filePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/user_db.sqlite")
        do {
            // 设置存储方式为SQLite数据库
            try storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: filePath, options: nil)
        } catch {
            print("Unable to add persistent store with error: \(error)")
            return
        }
        // 创建数据库操作上下文实例（核心的数据管理类，开发者通过它来直接进行数据的相关操作）
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        // 进行存储环境的关联
        context?.persistentStoreCoordinator = storeCoordinator
    }

    @IBAction func onInsertOne(_ sender: Any) {
        // 创建用户数据（NSEntityDescription用于将实体类进行实例化）
        let user = NSEntityDescription.insertNewObject(forEntityName: "UserEntity", into: context!) as! UserEntity
        user.name = "MinKin"
        user.age = 28
        user.id = 1
        user.houseId = 88
        // 创建房屋数据
        let house = NSEntityDescription.insertNewObject(forEntityName: "HouseEntity", into: context!) as! HouseEntity
        house.id = 88
        house.house_type = "150平米的商品房"
        user.monitor = house
        // 进行存储
        do {
            try context?.save()
            print("新增数据成功")
        } catch {
            print("新增数据失败: \(error)")
        }
    }

    @IBAction func onDeleteOne(_ sender: Any) {
        // 创建一个fetch请求来查找要删除的用户
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", 1)

        do {
            // 执行fetch请求
            let results = try context?.fetch(fetchRequest)

            // 检查是否找到了用户
            if let user = results?.first {
                // 如果用户有一个关联的房屋，删除它
                if let house = user.monitor {
                    context?.delete(house)
                }

                // 删除用户
                context?.delete(user)

                // 保存上下文以应用删除
                try context?.save()
                print("删除用户及其关联房屋成功")
            } else {
                print("未找到要删除的用户")
            }
        } catch {
            print("删除用户时出错: \(error)")
        }
    }

    @IBAction func onUpdateOne(_ sender: Any) {
        // 创建一个fetch请求来查找要更新的用户
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", 1)

        do {
            // 执行fetch请求
            let results = try context?.fetch(fetchRequest)

            // 检查是否找到了用户
            if let user = results?.first {
                // 更新用户的姓名
                user.name = "New User Name"

                // 检查用户是否有关联的房屋，并更新房屋的类型
                if let house = user.monitor {
                    house.house_type = "New House Type"
                }

                // 保存上下文以应用更改
                try context?.save()
                print("更新用户及其关联房屋成功")
            } else {
                print("未找到要更新的用户")
            }
        } catch {
            print("更新用户时出错: \(error)")
        }
    }

    @IBAction func onQueryAll(_ sender: Any) {
        // 创建一个fetch请求来查找所有用户
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

        // 可选：设置排序描述符来排序结果
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        do {
            // 执行fetch请求
            let results = try context?.fetch(fetchRequest) ?? []

            if results.isEmpty {
                print("查找不到任何用户")
                return
            }

            // 遍历结果并访问用户的房屋信息
            for user in results {
                // 输出用户信息
                print("User Name: \(user.name ?? "Unknown"), User Age: \(user.age)")

                // 检查用户是否有关联的房屋，并输出房屋信息
                if let house = user.monitor {
                    print("House ID: \(house.id), House Type: \(house.house_type ?? "Unknown")")
                    print("")
                } else {
                    print("No house associated with this user.")
                }

                // 输出换行符以分隔不同的用户记录
                print()
            }
        } catch {
            // 处理错误
            print("Failed to fetch users and their houses: \(error)")
        }
    }
}
