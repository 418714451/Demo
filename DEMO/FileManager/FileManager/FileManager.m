//
//  FileManager.m
//  FileManager
//
//  Created by 杜昕宇 on 16/12/13.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

#pragma mark -
#pragma mark - 打印文件创建日期与大小
+ (void)FileSizeAndInformation{

    NSString *path = @"/Users/mori/Desktop/hello.text";

    NSString *str = @"My name is Mr";

    NSError *error;

    BOOL isWriterSuccess = [str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];

    if (isWriterSuccess) {
        NSLog(@"创建成功");
    } else {
        NSLog(@"error : %@", error);
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
//    attributes 属性的意思
    NSDictionary *dic = [fileManager attributesOfItemAtPath:path error:&error];

    NSLog(@"dic %@", dic);
}

#pragma mark -
#pragma mark - 获得目录下的文件与子文件目录列表
+ (void)getSubFileInformation{
//    1. 获得目标目录下, 第一级目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/mori/Desktop/XX-Net-master";
    NSError *error;
//    contents 目录, 内容的意思
    NSArray *array = [fileManager contentsOfDirectoryAtPath:path error:&error];
    NSLog(@"%@", array);

//    2. 逐级获取所有子集的目录
    NSArray *arr = [fileManager subpathsOfDirectoryAtPath:path error:&error];
    NSLog(@"array :  %@", arr);
}

#pragma mark -
#pragma mark -管理目录
#pragma mark -
#pragma mark - 创建目录
+ (void)creatFilePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/mori/Desktop/abc";
    NSError *error;
    /*withIntermediateDirectories 参数:
     YES 逐级创建文件夹
     NO 表示只能够创建一级目录*/
    BOOL isCreateSuccess = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    if (isCreateSuccess) {
        NSLog(@"创建成功");
    } else {
        NSLog(@"error : %@", error);
    }
}

#pragma mark - 
#pragma mark - 移动目录 剪切动作
+ (void)moveFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/mori/Desktop/abc";
    NSString *pathTo = @"/Users/mori/Desktop/ABCTO";
    NSError *error;
    BOOL isMoveSuccess = [fileManager moveItemAtPath:path toPath:pathTo error:&error];
    if (isMoveSuccess) {
        NSLog(@"移动成功");
    } else {
        NSLog(@"error  :  %@", error);
    }
}

#pragma mark -
#pragma mark - 删除
+ (void)removeItem{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/mori/Desktop/ABCTO";
    NSError *error;
    BOOL isRemoveSuccess = [fileManager removeItemAtPath:path error:&error];
    if (isRemoveSuccess) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"error %@", error);
    }
}

#pragma mark - 
#pragma mark - 拷贝文件
+ (void)copyItem{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = @"/Users/mori/Desktop/hello.text";
    NSString *pathTo = @"/Users/mori/Desktop/h.text";
    NSError *error;
    BOOL isCopySuccess = [fileManager copyItemAtPath:path toPath:pathTo error:&error];
    if (isCopySuccess) {
        NSLog(@"拷贝成功");
    } else {
        NSLog(@"error : %@", error);
    }
}
@end
