//
//  ViewController.m
//  imageInformation
//
//  Created by 杜昕宇 on 16/12/13.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIImage 的 2 种加载图片方式
//    (1)   有缓存   (图片所占用的内存会一直停留在程序中),    可能会导致占用大量内存而使程序崩溃,  加载少量 小图片时候使用。
//    + (UIImage *)imageNamed:(NSString *)name;
//    (2)   无缓存   (图片所占用的内存会在一些特定操作后被清除),   在加载大量图片时候使用
//    + (UIImage *)imageWithContentsOfFile:(NSString *)path
//    - (id)initWithContentsOfFile:(NSString *)path;

}


@end
