//
//  SingHeadView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "SingHeadView.h"
#import "UIView+pgqViewExtension.h"
#import "PQ_TimerManager.h"
#import "BasicHeader.h"
@interface SingHeadView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIView *bCenterView;
@property (weak, nonatomic) IBOutlet UIView *bLeftTopView;
@property (weak, nonatomic) IBOutlet UIView *bRightTop;
@property (weak, nonatomic) IBOutlet UIView *bLeftBottomView;
@property (weak, nonatomic) IBOutlet UIView *bRightBottomView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic)  UIPageControl *pageControl;
@property (nonatomic,strong) PQ_TimerManager *timerManager;;
@property (nonatomic,assign) NSInteger pageIndex;
@property (nonatomic,copy) SingHeadScrollBlock scrollBblock;
@property (nonatomic,copy) SingHeadBodyBlock bodyBlock;
@end

@implementation SingHeadView
- (void)layoutSubviews{
    self.bCenterView.height = self.bCenterView.width;
    self.bCenterView.layer.cornerRadius = self.bCenterView.width / 2;
    
    self.bCenterView.centerY = (self.centerView.height / 2);
    [self setUpForTopScrollView];
    [self setUpForPageControl];
    [self createTimer];
}

+ (instancetype)singHeadViewForNib{
    NSBundle *bundle=[NSBundle mainBundle];
    NSArray *objs=[bundle loadNibNamed:@"SingHeadView" owner:nil options:nil];
    return [objs firstObject];
}

- (IBAction)singHead_bodyTapEvent:(UITapGestureRecognizer *)sender {
    self.bodyBlock(sender.view.tag);
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
    [self addSubview:self.pageControl];
    pageControl.y = self.topScrollView.height - 20;
}

- (void)setUpForTopScrollView{
    for (int i = 0; i < 5; i++) {
        UIView * view = [[UIView alloc]initWithFrame:self.topScrollView.bounds];
        view.x = i * PL_SRCEEN_WIDTH;
        view.height += 20;
        view.backgroundColor = RANDOM_COLOR;
        [self.topScrollView addSubview:view];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singHead_topScrollClickItem)];
        [view addGestureRecognizer:tap];
    }
    self.topScrollView.contentSize = CGSizeMake(5 * PL_SRCEEN_WIDTH, 0);
    
}

- (void)singHead_topScrollClickItem{
    self.scrollBblock(_pageIndex);
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

- (void)scrollViewClickItem:(SingHeadScrollBlock)block{
    self.scrollBblock = block;
}
- (void)bodyViewClickItem:(SingHeadBodyBlock)block{
    self.bodyBlock = block;
}

@end
