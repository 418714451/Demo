//
//  ViewController.m
//  沙盒
//
//  Created by 杜昕宇 on 16/12/21.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1. 应用沙盒概述
//    每个 iOS 应用 都有 自己的 应用 沙盒(应用沙盒就是 文件 系统 目录), 与其他文件隔离. 应用必须呆在自己的沙盒里, 其他应用不能访问该沙盒.
//    2. 应用沙盒结构分析
//    Documents : 保存应用运行时生成的需要持久化的数据, iTunes 同步设备时会 备份 该目录.
//    tmp: 保存应用运行时所需的临时数据, 使用完毕后 再将 相应的 文件 从 该目录删除, 应用没有运行时, 系统也可能会消除该目录下的文件, iTunes 同步设备时 不会 备份 该目录.
//    Library/Caches: 保存应用运行时 生成的 需要持久化的 数据, iTunes 同步设备时不会备份该目录. 一般存储体积大, 不需要备份的非重要数据
//    Library/Preference: 保存应用的所有偏好设置, iOS 的 Setting( 设置) 应用会在该目录中 查找应用的设置信息. iTunes 同步设备时 会备份该目录.

//    总结 :
//    1. 体积大(iTunes 不会备份)
//    1> tmp( 里面的内容可能会被系统随机清除)
//    2> Library/Caches
//    2. 体积小(iTunes 会备份)
//    1> Documents
//    2> Library/Preference

//    3. 应用沙河目录的常见获取方式
//    获取沙盒根目录
    NSString *home = NSHomeDirectory();

//    获取文件目录(2种方式)
//    1> 利用沙盒根目录拼接字符串
    NSString *home1 = NSHomeDirectory();
    NSString *documents = [home stringByAppendingPathComponent:@"Documents"]; // 获取其他几个目录也类似
//     其中 stringByAppendingPathComponent 方法可以直接在 Documents 前拼上斜杠
//    不建议采用, 因为新版本的操作系统可能会修改目录名

//    2> 利用 NSSearchPathForDirectoriesinDomains 函数
//    获取根目录
    NSString *homeDir = NSHomeDirectory();
//    获取 Documents 目录路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;

//    获取 caches 目录路径
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;

    NSString *tmpPath = NSTemporaryDirectory();

    NSLog(@"----%@----------%@", cachesPath, tmpPath);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
