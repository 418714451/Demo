//
//  ViewController.m
//  本地存储
//
//  Created by 杜昕宇 on 16/12/1.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "ViewController.h"
#import "MacroDefinition.h"

#import "File.h"

@interface ViewController ()

//brief    沙盒
@property (nonatomic, strong)  File *filePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.filePath getArrayByPlist];
}

- (File *)filePath{
    if (!_filePath) {
        _filePath = [[File alloc] init];
    }
    return _filePath;
}


@end
