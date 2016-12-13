//
//  File.m
//  本地存储
//
//  Created by 杜昕宇 on 16/12/1.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "File.h"

@implementation File

- (NSString *)sayFilePath{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSLog(@"本地存储地址--%@", path);
    return path;
}

- (NSString *)documentsPath{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"filePath:%@", path);
    return path;
}

- (NSString *)libraryAndCachesPath{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"filePath:%@", path);
    return path;
}

- (NSString *)tmpPath{
    NSString *path = NSTemporaryDirectory();
    NSLog(@"filePath:%@", path);
    return path;
}

/**
 plist文件是将某些特定的类, 通过 XML 文件的方式保存在目录中. 可以被序列化的类型只有如下几种: 
 NSArray;
 NSMutableArray;
 NSDictionary;
 NSMutableDictionary;
 NSData;
 NSMutableData;
 NSString;
 NSMutableString;
 NSNumber;
 NSDate;
 */
- (void)saveArrayFileByPlist:(NSArray *)array{
//    1. 获得文件路径 并且拼接新地址
    NSString *fileName = [[self documentsPath] stringByAppendingPathComponent:@"hello.plist"];
//    2. 存储
    if (array.count == 0) {
        NSArray *arr = @[@"hello", @"world", @"iOS"];
        [arr writeToFile:fileName atomically:YES];
    } else {
    [array writeToFile:fileName atomically:YES];
    }
}
//    注意
//
//* 只有以上列出的类型才能使用plist文件存储。
//* 存储时使用writeToFile: atomically:方法。 其中atomically表示是否需要先写入一个辅助文件，再把辅助文件拷贝到目标文件地址。这是更安全的写入文件方法，一般都写YES。
//* 读取时使用arrayWithContentsOfFile:方法。
- (NSArray *)getArrayByPlist{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[self documentsPath] stringByAppendingPathComponent:@"hello.plist"]];
    NSLog(@"%@", array);
    return array;
}

@end
