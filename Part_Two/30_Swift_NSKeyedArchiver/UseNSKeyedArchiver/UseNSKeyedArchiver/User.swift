//
//  User.swift
//  UseNSKeyedArchiver
//
//  Created by 彭明健 on 2024/10/18.
//

import UIKit

class User: NSObject, NSCoding {
    /*
        归档
     */
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(age, forKey: "age")
    }

    /*
        解归档
     */
    required init?(coder: NSCoder) {
        super.init()
        self.name = coder.decodeObject(forKey: "name") as? String
        self.age = coder.decodeInteger(forKey: "age")
    }

    var name: String?
    var age: NSInteger = 0

    override init() {
        super.init()
    }
}
