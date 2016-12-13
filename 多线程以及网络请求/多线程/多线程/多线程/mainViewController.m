#import "mainViewController.h"

@interface mainViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self creatNSThread];
}

//    线程的注意点
//    1. 不要同时开太多的线程(1~3条即可, 不要超过5条)
//    线程概念
//    1. 主线程: UI 线程, 显示/ 刷新 UI 界面. 处理 UI 控件的事件
//    2. 子线程: 后台线程, 异步线程
//    不要把耗时的操作放在主线程. 要放在子线程中执行

//    线程间通信的体现
//    1个线程传递数据给另1个线程
//    在1个线程中执行完特定任务后, 转到另1个线程继续执行任务

//    创建 NSThread
- (void)creatNSThread{
//    创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    thread.name = @"线程";
//    启动线程
    [thread start];
    // 线程开启 放到可调度线程池  在可调度线程池为就绪状态 . 调度时候变成运行状态, 不调度时变为就绪状态, 使用 sleep 线程变为阻塞状态, 从调度池移出. 但是没有销毁.  当 sleep 执行完变为就绪状态.                             线程任务执行完毕 / 异常/ 强制退出 线程销毁
//      可调度线程池 分别调用所有线程
//    [NSThread exit];// 线程退出后不能再次执行对象方法

//    创建线程并启动
//    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];

//    隐式创建线程 (在主线程)
//    [self performSelector:@selector(run) withObject:nil];

//    隐式创建线程 (在子线程)
//    [self performSelectorInBackground:@selector(run) withObject:nil];


//    判断是否主线程
//    [NSThread isMainThread];
}

- (void)run{
    for (NSInteger i = 0; i < MAXFLOAT; i++) {
        if (i == 100) {
//            [NSThread sleepForTimeInterval:5];  // 睡眠 5秒
//            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:5];
        }
        NSLog(@"---------------%ld--------%@-------%@", i, [NSThread mainThread],[NSThread currentThread]);
    }

}

@end
//    主线程 : iOS 程序运行后, 默认开启一条线程 称为主线程
//    主线程负责显示/刷新 UI 界面
//    处理 UI 事件(点击, 滚动, 拖拽等)
//    主线程的使用注意
//    别将比较耗时的操作放到主线程中


//    子线程 : 主线程中创建的线程

//    NSThread 使用更加面向对象  简单易用, 可直接操作线程对象  OC  生命周期 程序猿管理 偶尔使用
//    GCD 旨在替代 NSThread 等线程技术 充分利用设备的多核         C     生命周期  自动管理     经常使用
//    NSOperation  基于 GCD  比 GCD 多了一些更简单使用的功能  使用更加面向对象    OC    生命周期  自动管理     经常使用

//    多线程的安全隐患
//    一块资源可能被多个线程共享, 也就是多个线程肯能访问同一块资源
//    当多个线程访问同一块资源时, 很容易引发数据错乱和数据安全
