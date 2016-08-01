//
//  SingViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "SingViewController.h"
#import "BasicHeader.h"
#import "PQ_TimerManager.h"
@interface SingViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic)  UIPageControl *pageControl;
@property (nonatomic,strong) PQ_TimerManager *timerManager;;
@end

@implementation SingViewController{
    NSInteger _pageIndex;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpForTopScrollView];
    [self setUpForPageControl];
    
    //建立一个定时器 轮播
    [self createTimer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews{
    self.pageControl.centerX = self.topScrollView.centerX;
}


//public

- (void)startTopScrollViewTimer{
    [self.timerManager pq_open];
//    NSLog(@"打开了定时器");
}

- (void)closeTopScrollViewTimer{
    [self.timerManager pq_close];
//    NSLog(@"关闭了定时器");
}

// my method
- (void)createTimer{
    @weakify(self);
    self.timerManager = [PQ_TimerManager pq_createTimerWithType:PQ_TIMERTYPE_CREATE updateInterval:3 repeatInterval:1 update:^{
        @strongify(self);
        _pageIndex ++;
        if (_pageIndex >= 5) {
            _pageIndex = 0;
        }
        //这里调用方法后不会到滑动停止的方法 所以要自己在开始定时器
        [self.topScrollView setContentOffset:CGPointMake(_pageIndex * PL_SRCEEN_WIDTH, 0) animated:YES];
        self.pageControl.currentPage = _pageIndex;
    }];
}

- (void)setUpForPageControl{
    UIPageControl * pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, PL_SRCEEN_WIDTH, 20)];
    self.pageControl = pageControl;
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    pageControl.y = CGRectGetMaxY(self.topScrollView.frame)-20;
}

- (void)setUpForTopScrollView{
    for (int i = 0; i < 5; i++) {
        UIView * view = [[UIView alloc]initWithFrame:self.topScrollView.bounds];
        view.x = i * PL_SRCEEN_WIDTH;
        view.height += 20;
        view.backgroundColor = RANDOM_COLOR;
        [self.topScrollView addSubview:view];
        NSLog(@"width - %f height - %f y - %f",self.topScrollView.width,self.topScrollView.height,view.y);
    }
    self.topScrollView.contentSize = CGSizeMake(5 * PL_SRCEEN_WIDTH, 0);
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //滑动的时候暂停计时
    NSLog(@"难道来这里了？");
    [self.timerManager pq_pause];
}

- (void) scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = sender.frame.size.width;
    _pageIndex = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = _pageIndex;
    //滑动结束，这个时候我们应该把计时器归零，在计算
    [self.timerManager pq_updateTimeIntervalToZero];
    [self.timerManager pq_start];
    NSLog(@"那没理由不来这里啊");
}
@end
