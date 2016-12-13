//
//  File.h
//  本地存储
//
//  Created by 杜昕宇 on 16/12/1.
//  Copyright © 2016年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File : NSObject

/**
 应用程序包: 这里面存放的是应用程序的源文件, 包括资源文件和可执行文件

 @return 地址
 */
- (NSString *)sayFilePath;

/**
 最常用的目录, iTunes同步该应用是会同步此文件夹中的内容, 适合存储重要数据

 @return 地址并打印
 */
- (NSString *)documentsPath;

/**
 Library/Caches: iTunes不会同步此文件夹, 适合存储体积大, 不需要备份的非重要数据

 @return 地址并打印
 */
- (NSString *)libraryAndCachesPath;

/**
 iTunes不会同步此文件夹, 系统可能在应用没运行时就删除该目录下的文件, 所以此目录适合保存应用中的一些临时文件,用完就删除

 @return 地址并打印
 */
- (NSString *)tmpPath;

/**
 存储到 list 文件中

 @param obj 暂时没用
 */
- (void)saveArrayFileByPlist:(id)obj;

/**
 获取存储到 list 文件中的数据

 @return 返回的数据
 */
- (NSArray *)getArrayByPlist;
@end
