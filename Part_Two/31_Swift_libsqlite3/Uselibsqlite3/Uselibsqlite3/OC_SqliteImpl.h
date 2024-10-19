//
//  OC_SqliteImpl.h
//  Uselibsqlite3
//
//  Created by 彭明健 on 2024/10/19.
//

#import <Foundation/Foundation.h>
// 引入头文件
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN

@interface OC_SqliteImpl : NSObject

// 创建一个执行非查询语句的方法
+(void)runNormalSql:(NSString *)sqlString;
// 创建一个查询数据的方法
+(void)selectSql;

@end

NS_ASSUME_NONNULL_END
