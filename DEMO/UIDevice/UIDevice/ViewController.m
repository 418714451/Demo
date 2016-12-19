//
//  ViewController.m
//  UIDevice
//
//  Created by 杜昕宇 on 16/12/19.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIDevice 通知
//    UIDevice 类提供了一个单例对象, 它代表着设备, 通过它可以获得一些设备相关的信息, 比如电池电量值(batteryLevel). 电池状态( batteryState). 设备的类型( model. 比如 iPode.iPhone 等). 设备的系统(systemVersion)
//    UIDevice 特点
//    1> 通过 [UIDevice currentDevice]可以获取这个单例对象
//    2> UIDevice 对象 会 不间断的发布一些通知, 下列是 UIDevice 对象锁发布通知的名称常量
//    UIDeviceOrientationDidChangeNotification  设备旋转
//    UIDeviceBatteryStateDidChangeNotification 电池状态改变
//    UIDeviceBatteryLevelDidChangeNotification 电池电量改变
//    UIDeviceProximityStateDidChangeNotification 近距离传感器 (比如设备贴近使用者的脸部)

    NSLog(@"电池电量%.f", [UIDevice currentDevice].batteryLevel);
    NSLog(@"设备系统: %@", [UIDevice currentDevice].systemVersion);


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
