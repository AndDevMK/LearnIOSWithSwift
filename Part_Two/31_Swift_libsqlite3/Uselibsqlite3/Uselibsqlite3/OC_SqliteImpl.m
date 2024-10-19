//
//  OC_SqliteImpl.m
//  Uselibsqlite3
//
//  Created by 彭明健 on 2024/10/19.
//

#import "OC_SqliteImpl.h"

@implementation OC_SqliteImpl

+ (void)runNormalSql:(nonnull NSString *)sqlString {
    // sqlite指针用来对数据库进行操作
    sqlite3 * sql;
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * file = [NSString stringWithFormat:@"%@/user_db.sqlite", path];
    NSLog(@"数据库位置: %@", file);
    // 用于打开一个数据库文件，其中第1个参数为数据库文件的路径，第2个参数为sqlite指针的地址
    sqlite3_open([file UTF8String], &sql);
    // 字符指针，用于接收错误信息
    char * err;
    // 执行非查询类SQL语句，第1个参数为sqlite3指针，第2个参数为SQL语句字符串
    int code = sqlite3_exec(sql, [sqlString UTF8String], NULL, NULL, &err);
    if(code == SQLITE_OK) {
        NSLog(@"执行成功");
    }else {
        NSLog(@"执行失败");
    }
}

+ (void)selectSql {
    // sqlite指针用来对数据库进行操作
    sqlite3 * sql;
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * file = [NSString stringWithFormat:@"%@/user_db.sqlite", path];
    NSLog(@"数据库位置: %@", file);
    // 用于打开一个数据库文件，其中第1个参数为数据库文件的路径，第2个参数为sqlite指针的地址
    sqlite3_open([file UTF8String], &sql);
    // 游标
    sqlite3_stmt *stmt;
    // 准备执行查询工作
    sqlite3_prepare_v2(sql, [@"select * from user" UTF8String], -1, &stmt, NULL);
    // 进行循环取值
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        int id = sqlite3_column_int(stmt, 0);
        NSString * name = [NSString stringWithCString:sqlite3_column_text(stmt, 1) encoding:NSUTF8StringEncoding];
        int age = sqlite3_column_int(stmt, 2);
        NSLog(@"id: %d, name: %@, age: %d", id, name, age);
    }
    // 关闭游标
    sqlite3_finalize(stmt);
}

@end
