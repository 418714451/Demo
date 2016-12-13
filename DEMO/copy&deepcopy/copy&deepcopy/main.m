//
//  main.m
//  copy&deepcopy
//
//  Created by 杜昕宇 on 16/12/13.
//  Copyright © 2016年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");

//        1. 深拷贝 && 浅拷贝 概念
//        浅拷贝 : 并不拷贝对象本身, 仅仅是   拷贝   指向对象  的  指针
//        深拷贝 : 深拷贝是直接   拷贝整个对象内存 到 另一块内存中

//        在  非集合类 对象中:
//        对 immutable 对象进行 copy 操作, 是指针复制
//        mutableCopy 操作时 内容复制
//        mutable 对象进行   copy 和 mutableCopy 都是内容复制

//        在   集合类 对象中:
//        对 immutable 对象进行 copy 操作, 是指针复制
//        mutableCopy 是内容复制
//        对 mutable 对象进行  copy 和 mutableCopy 都是内容复制
//        注意: 集合对象的内容复制仅限对象本身, 对象元素仍然是指针复制

//        NSString 的注意点
        NSString *str = @"string";
        str = @"newString";
//        对 str 重新复制, 内存地址发生变化, 因为左边的 str 是一个指针, 此处修改的是内存地址
//        所以第二行将 newString 当做一个新的对象. 将这段对象的内存地址赋值给 str

    }
    return 0;
}
