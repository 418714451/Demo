#import "ViewController.h"
#import "MacroDefinition.h"

/*!
 @author 杜昕宇, 16-08-25 14:08:10

 @brief GCD 
 纯 C 语言, 提供了非常多强大的函数
 GCD  优势
 GCD 是苹果公司为多核的并行运算提出的解决方案
 GCD 会自动利用更多的 CPU 内核
 GCD 会自动管理线程的生命周期(创建线程. 调度任务. 销毁线程)
 
 GCD 两个核心概念
  任务 : 执行什么操作
  队列 : 用来存放任务
 
 GCD 的使用就两个步骤
    1. 定制任务
    2. 确定想做的事情
 
 将任务添加到队列中
    GCD 会自动将队列中的任务取出, 放到对应的线程中执行

 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//        dispath_sync : 同步, 不具备开启线程能力
//    dispatch_async : 异步, 具备开启线程的能力

//    并发队列 : 多个任务可以同时执行
//    串行队列 : 一个任务执行完后, 再执行下一个任务

//    获取全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    将 任务 添加到 全局中 去 异步 执行
    dispatch_async( queue, ^{
        NSLog(@"----下载图片----%@", [NSThread currentThread]);
    });

}

/*!
 @author 杜昕宇, 16-09-08 11:09:46

 @brief async -- 并发队列(最常用)
 会不会创建线程 : 会, 一般同时开多条
 任务的执行方式: 并发执行
 */
- (void)asyncGlobalQueue{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

    });

}

/*!
 @author 杜昕宇, 16-09-08 11:09:46

 @brief async -- 串行队列
 会不会创建线程. 会 一般只开一条线程
 任务的执行方式: 串行执行
 */
- (void)asyncSerialQueue{
//    1. 创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("time", NULL);

//    2. 将任务添加到串行队列中 异步执行
    dispatch_async(queue, ^{

    });
}


/*!
 @author 杜昕宇, 16-09-08 11:09:46

 @brief sync -- 并发队列
 */
- (void)syncGlobalQueue{
//    全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

    });
}

/*!
 @author 杜昕宇, 16-09-08 11:09:46

 @brief sync -- 串行队列
 */
- (void)syncSerialQueue{
//    创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("time", NULL);
    dispatch_sync(queue, ^{

    });
}

/*!
 @author 杜昕宇, 16-09-08 11:09:22

 @brief async  -- 主队列

 */
- (void)mainQueue{
//    1. 主队列 (添加到主队列中的任务, 都会自动放到主线程中去执行)
    dispatch_queue_t queue = dispatch_get_main_queue();

//    2. 添加 任务 到主队列 中 异步执行
    dispatch_async(queue, ^{

    });
}


@end
