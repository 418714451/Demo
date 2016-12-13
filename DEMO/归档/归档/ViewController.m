//
//  ViewController.m
//  归档
//
//  Created by 杜昕宇 on 16/11/22.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "ViewController.h"

#import "XYApple.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
        对象归档
     所谓对象归档, 就是类似于其他语言中的"序列化"机制, 归档就是用某种格式把一个或多个对象保存到指定文件夹中, 方便以后文件中回复他们. 通常来说, 归档包含两方面的操作; 一方面需要把对象写入指定文件夹中, 另一方面需要从文件中恢复这些对象
     */


    /**
        1. NSKeyedArchiver
     使用 NSKeyedArchiver 配套使用的还有一个 NSKeyedUnarchiver 类, 其中, NSKeyedArchiver 负责将对象归档到指定文件中, 而 NSKeyedUnarchiver 则负责从文件中恢复这些对象.
    NSKeyedArchiver 会创建一种所谓的带键( keyed) 的归档, 在这种格式中
     */

    NSDictionary *dict = @{@"Objective-C" : @89, @"Ruby" : @69, @"Python" : @75, @"Perl" : @109};

    //  创建文件目录
    [[NSFileManager defaultManager] createDirectoryAtPath:[self myPath:nil] withIntermediateDirectories:YES attributes:nil error:nil];

    // 使用 NSKeyedArchiver 的类方法将给对象归档成 myDict.archive(这个文件名可以任意指定)
    [NSKeyedArchiver archiveRootObject:dict toFile:[self myPath:@"myDict.rachive"]];

    // 回复指定的文件名对象
    NSDictionary *myDict = [NSKeyedUnarchiver unarchiveObjectWithFile:[self myPath:@"myDict.rachive"]];

    NSLog(@" myDict == %@", myDict);


    /*
     实现NSCoding协议
     使用NSKeyedArchiver和NSKeyedUnarchiver进行归档和恢复非常简单，如果尝试使用NSKeyedArchiver将一个自定义的对象归档到指定文件中，运行程序将会提示错误。
     实际上，如果程序需要归档、恢复任何自定义类的实例，那么该类应该实现NSCoding协议：
     initWithCoder 该方法负责恢复对象。
     encodeWithCoder该方法负责归档对象。
     当程序归档某个对象时，总会调用encodeWithCoder方法；当程序恢复某个对象时，总会调用initWithCoder方法。
     一般来说，如果对象的成员变量是Objective-C类型，并且实现了NSCoding协议，则可以直接调用encodingObject:forKey:方法来归档该成员变量，是用decodeObjectForKey:方法来恢复该成员变量；如果对象的成员变量是Objective-C类型，但没有实现NSCoding协议，那么归档该类的实例就比较困难。
     */

    XYApple *apple = [[XYApple alloc] initWithColor:@"黑色" weight:123.2 size:20];
    [NSKeyedArchiver archiveRootObject:apple toFile:[self myPath:@"myApple.archive"]];

    XYApple *myApple = [NSKeyedUnarchiver unarchiveObjectWithFile:[self myPath:@"myApple.archive"]];
    NSLog(@"myAppleInfo = %@", [myApple description]);


    /*
     2. 是用NSData完成自定义归档
     前面已经提到，使用NSKeyedArchiver或NSKeyedUnarchiver的类方法来归档或恢复对象，这种方式虽然简单、易用，但每次总是将单个对象作为root进行归档或恢复。如果程序需要归档、恢复更多的对象，那么可以借助NSMutableData来创建NSKeyedArchiver或NSKeyedUnarchiver对象。
     */

    NSSet *set = [NSSet setWithObjects:@"讲义", @"讲义", @"讲义", nil];
//    创建一个 NSMutableData 对象, 用于保存归档数据
    NSMutableData *mData = [NSMutableData data];

//    以 NSMutableData 对象作为参数, 创建 NSKeyedArchiver
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];

//    重复调用 encodeObject:forkey 方法归档所有需要归档对象
    [archiver encodeObject:dict forKey:@"myDict"];
    [archiver encodeObject:apple forKey:@"myApple"];
    [archiver encodeObject:self forKey:@"mySet"];
    [archiver finishEncoding];

//    将 NSData 缓存区保存的数据写入文件
    if (![mData writeToFile:[self myPath:@"myData.archive"] atomically:YES]) {
        NSLog(@"归档失败");
    }


//    以 NSData 作为参数, 创建 NSKeyedUnarchiver 对象
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[NSData dataWithContentsOfFile:[self myPath:@"myData.archive"]]];

//    重复调用 decodeObjectForKey: 方法恢复所有需要恢复的对象
    NSDictionary *myDict2 = [unarchiver decodeObjectForKey:@"myDict"];
    XYApple *myApple2 = [unarchiver decodeObjectForKey:@"myApple"];
    NSSet *set2 = [unarchiver decodeObjectForKey:@"mySet"];
    [unarchiver finishDecoding]; // 结束恢复

    NSLog(@"%@\n%@\n%@", myDict2, myApple2, set2);

    /*
     使用归档实现深复制
     归档会将整个对象转换为字节数据——包括该对象的所有成员变量，如果该成员变量指向另一个Objective-C对象，归档时也会归档该成员变量所指向的Objective-C对象。这表明：当程序归档一个对象时，系统会把该对象关联的所有数据都转换为字节数据；如果程序从这些字节数据中恢复这些对象，那么恢复出来的对象与原来对象将完全相同，但没有任何共用的部分，这就实现了深复制。
     */

    NSDictionary *dict2 = @{@"one": [[XYApple alloc] initWithColor:@"橙色" weight:5.4 size:80], @"two": [[XYApple alloc] initWithColor:@"白色" weight:4.4 size:23]};

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict2]; // 将对象写入 NSData 中归档

    NSDictionary *dictCopy = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    XYApple *app = dictCopy[@"one"];
    app.color = @"黄色";
    XYApple *app1 = dict2[@"one"];
    NSLog(@"app1.color = %@", app1.color);
}


- (NSString *)myPath:(NSString *)childPath{
    NSString *myPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"myArchive"] stringByAppendingPathComponent:childPath];
    NSLog(@"%@", myPath);
    return myPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
