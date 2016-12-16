//
//  ViewController.m
//  ScrollView
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

//    1. ScrollView 无法滚动的解决办法
//    1> 没有这事滚动范围 contentSize
//    2> scrollEnalbe = NO
//    3>没有接受到触摸事件: userInteractionEnable = NO
//    4> stroryboard 没有取消 autolayout 功能

//    2 UIScrollView 的属性
//    @property(nonatomic) CGPoint contentOffset;  //这个属性用来表示 UIScrollView 滚动的位置
//    @property(nonatomic) CGSize contentSize; // 这个属性用来表示 UIScrollView 内容的尺寸, 滚动范围
//    @property(nonatomic) UIEdgeInsets contentInset; // 这个属性能够在 UIScrollView 的四周增加额外的滚动区域
//    @property(nonatomic) BOOL bounces; // 设置 UIScrollView 是否需要弹簧效果
//    @property(nonatomic, getter=isScrollEnabled) BOOL scrollEnabled; // 设置 UIScrollView 是否能滚动
//    @property(nonatomic) BOOL showsHoriontalScrollIndicator; 是否显示水平滚动条
//    @property(nonatomic) BOOL showsVerticalScrollIndicator;是否显示垂直滚动条
//    pageEnable 设置 YES  UIScrollView 分割成多个独立页面

//    3. 内容缩放
//    缩放实现步骤
//    1. 设置 UIScrollView 的 id <UIScrollViewDelegate> delegate 代理对象
//    2. 设置 minimumZoomScale : 缩小的最小比例
//    3. 设置 maximumZoomScale : 放大的最大比例
//    4. 让代理对象实现下面的方法, 返回需要缩放的视图控件
//    - (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;

//    跟缩放相关的其他代理方法
//    缩放完毕的时候调用
//    - (void)scrollViewDidZoom:(UIScrollView *)scrollView;
//    正在缩放的时候调用
//    - (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view

//        4. 分页
//    UIPageControl 控件常用属性
//    @property(nonatomic) NSInteger numberOfPages; // 一共有多少页
//    @property(nonatomic) NSInteger currentPage; // 当前显示的页码
//    @property(nonatomic) BOOL hidesForSignlePage; // 只有一页时, 是否需要隐藏页码指示器
//    @property(nonatomic, retain) UIColor *pageIndicatorTintColor; // 其他页码指示器的颜色
//    @property(nonatomic, retain) UIColor *currentPageIndicatorTintColor; // 当前页码指示器的颜色

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
