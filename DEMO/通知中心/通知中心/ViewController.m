//
//  ViewController.m
//  通知中心
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
//    1. 通知中心
//    每一个应用程序都有一个通知中心(NSNotificationCenter) 实例, 专门负责协助不同对象之间的消息通信, 任何一个对象都可以向通知中心发布通知( NSNotification), 描述自己在做什么. 其他感兴趣的对象(Observer)可以申请在某个特定通知发布时(或在某个特定的对象发布通知时)收到这个通知
//    通知与代理的区别: 通知时多对多, 代理是一对一
//    2, 通知(NSNotification)
//    一个完整的通知一般包含3个属性:
//    name //通知的名称
//    object  // 通知发布者(是谁要发布通知)
//    userInfo // 一些额外的信息(通知发布者传递给通知接收者的信息内容)

//    创建一个通知(NSNotification)对象
//    1
//    NSNotification *notification = [NSNotification notificationWithName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#>]
//    2
//NSNotification *notification = [NSNotification notificationWithName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#> userInfo:<#(nullable NSDictionary *)#>]
//    3
//NSNotification *notification = [NSNotification alloc] initWithName:<#(nonnull NSNotificationName)#> object:<#(nullable id)#> userInfo:<#(nullable NSDictionary *)#>

//    3. 发布通知
//    获取通知中心对象
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];

//    通知中心提供的发布通知的方法
//    center postNotification:<#(nonnull NSNotification *)#>
//    发布了一个 notification 通知, 可再 notification 对象中设置通知的名称. 通知发布者. 额外信息等

//    center postNotificationName:<#(nonnull NSNotificationName)#>aName object:<#(nullable id)#>aObject
//    发布了一个名称为 aName  的通知, anobject 为这个通知的发布者

//    center postNotificationName:<#(nonnull NSNotificationName)#>aName object:<#(nullable id)#>nObject userInfo:<#(nullable NSDictionary *)#>aUserInfo
//    发布一个名称为 aName 的通知, anObject 为这个通知的发布者. aUserInfo为额外信息

//    4. 注册通知监听器
//    通知中心(NSNotificationCenter)提供了一个方法来注册一个监听通知的监听器(Observer)
//    方法1 :
//    - (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
//    observer : 监听器, 即谁要接受这个通知
//    aSelector: 收到通知后, 回调监听器的这个方法, 并且把通知对象当做参数传入, 意思是收到通知后调用接受者中的哪个方法
//    aName: 通知的名称. 如果为 nil, 那么无论通知的名称是什么, 监听器都能收到了这个通知, 意思是监听哪个 aName 的通知
//    anObject: 通知发布者, 如果为 anObject 和 aName都为 nil,监听器都收到所有的通知, 意思是监听哪个对象发送的通知

//    例如:监听输入框内容是否发生改变:
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:
//     @selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField]; 当输入框内容发生改变会自动发送通知,之后会调用我们自定义的 textChange 方法。

//    [NSNotificationCenter defaultCenter] addObserverForName:<#(nullable NSNotificationName)#> object:<#(nullable id)#> queue:<#(nullable NSOperationQueue *)#> usingBlock:<#^(NSNotification * _Nonnull note)block#>
//    name: 通知的名称
//    obj: 通知发布者
//    queue: 决定了 block 在哪个操作队列中执行, 如果传 nil , 默认在当前操作队列中同步执行
//    block : 收到对应的通知时, 会回调这个 block


//    5. 取消注册通知监听器
//    通知中心不会保留( retain)监听器对象, 再通知中心注册过的对象, 在通知中心注册过的对象, 必须在该对象释放前取消注册. 否则, 当相应的通知再次出现时, 通知中心仍然会向该监听器发送消息. 因为相应的监听器对象已经被释放了, 所以可能会导致应用崩溃
//    通知中心 供了相应的方法来取消注册监听器
//    (1)- (void)removeObserver:(id)observer;
//    (2)- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
