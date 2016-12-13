//
//  main.m
//  plistInformation
//
//  Created by 杜昕宇 on 16/12/13.
//  Copyright © 2016年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        1. Plist 文件概述
//        属性列表文件存储 NSArray 或者 NSDictionary 之类的数据, 这种属性列表文件的扩展名是 plist, 因此也成为 Plist 文件
//        2. 创建 Plist 文件
//        创建 Plist 文件  名称  当中  不能带 info, 如果带了 info 会导致 xcode 把他 误当做 一个项目 中 某个文件 而出现 问题, 导致 文件 加载 不出来
//        3. 解析 Plist 文件
//        1> 获取 Plist 文件的全路径
//        NSBundle *bundle = [NSBundle mainBundle];
//        NSString *path = [bundle pathForResource:@"文件名" ofType:@"扩展名"];
//        2> 加载 Plist 文件
//        self.array = [NSArray arrayWithContentsOfFile:path]


    }
    return 0;
}
