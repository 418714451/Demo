//
//  FileManager.h
//  FileManager
//
//  Created by 杜昕宇 on 16/12/13.
//  Copyright © 2016年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

/**
 打印文件创建日期与大小
 */
+ (void)FileSizeAndInformation;

/**
 获得目录下的文件与子文件目录列表
 */
+ (void)getSubFileInformation;


/**
 创建目录
 */
+ (void)creatFilePath;

/**
 移动目录
 */
+ (void)moveFile;

/**
 删除
 */
+ (void)removeItem;

/**
 拷贝文件
 */
+ (void)copyItem;

@end
