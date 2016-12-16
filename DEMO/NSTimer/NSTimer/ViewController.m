//
//  ViewController.m
//  NSTimer
//
//  Created by 杜昕宇 on 16/12/16.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSTimer
//    1. NSTimer 叫做"定时器", 它的作用如下
//    在指定的时间执行指定的任务
//    每隔一段时间执行指定的任务
//    2. 调用 NSTimer 下面的方法 就会开启一个定时任务
//    + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
//                                          target:(id)aTarget
//                                        selector:(SEL)aSelector
//                                        userInfo:(id)userInfo
//                                         repeats:(BOOL)yesOrNo
//    每隔 ti 秒, 调用一次 aTarget 的 aSelector 方法, yesOrNo 决定了是否重复执行这个任务
//    3. 通过 invalidate 方法可以停止定时器的工作, 一旦定时器被停止了, 就不能再次执行任务. 只能再创建一个新的定时器才能执行新的任务

//    [备注] 如果主线程中还有其他操作, NSTimer 的 scheduldTimerWithTimeInterval 方法将暂停执行, 当主线程中的相关操作结束后定时器操作才会继续执行. 比如上方时广告轮播图 (用定时器实现的图片轮播效果), 下面是 UITableView, 当我们拖动 UITableView 的时候, 上面广告轮播器是暂停轮播效果的, 解决办法加上下面代码. 使主线程在处理其他任务的时候不能暂定定时器操作:
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
