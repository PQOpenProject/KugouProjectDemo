//
//  PGQ_BaseCenterView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/25.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PGQ_BaseCenterView.h"
#import "BasicHeader.h"
#import "UIScrollView+PQScrollExtension.h"
@interface PGQ_BaseCenterView ()<UIScrollViewDelegate>

@property (nonatomic,copy) PGQ_BaseCenterViewPageIndexBlock pageIndexBlock;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSArray * viewControllers;
@property (nonatomic,copy) PGQ_BaseCenterViewPageOffSetBlock offsetBlock;

@end

@implementation PGQ_BaseCenterView{
    int _pageIndex;
    int _lastPageIndex;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _pageIndex = -1;
        _lastPageIndex = -1;
    }
    return self;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

+ (instancetype)pgq_baseConterViewWithVCS:(NSArray *)vcs PageBlock:(PGQ_BaseCenterViewPageIndexBlock)pageIndexBlock offSet:(PGQ_BaseCenterViewPageOffSetBlock)offSetBlock{
    PGQ_BaseCenterView * centerView = [[PGQ_BaseCenterView alloc]initWithFrame:CGRectMake(0, 0, PL_SRCEEN_WIDTH, PL_SRCEEN_HEIGHT-50-64)];
    centerView.pageIndexBlock = pageIndexBlock;
    centerView.offsetBlock = offSetBlock;
    centerView.viewControllers = vcs;
    [centerView addViewsForScrollView];
    return centerView;
}

- (void)addViewsForScrollView{
    int x = 0;
    for (int i = 0; i < self.viewControllers.count; i++) {
        x = i;
        UIViewController * viewController = self.viewControllers[i];
//        NSLog(@"把view添加进入scrollview之前 - %@",viewController.navigationController);
        viewController.view.x = i * self.scrollView.width;
        [self.scrollView addSubview:viewController.view];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.viewControllers.count * self.scrollView.width, 0);
    [self addSubview:self.scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"滑动停止之后 - nav %@", [self.viewControllers[0] navigationController]);
    self.pageIndexBlock(_pageIndex);
}

- (void) scrollViewDidScroll:(UIScrollView *)sender {
    // 得到每页宽度
    CGFloat pageWidth = sender.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    _pageIndex = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    double offset = floor(fabs(sender.contentOffset.x) - pageWidth/2.0)/(pageWidth/2.0);
    self.offsetBlock(offset);
//    NSLog(@"%lf",offset);
}


- (void)updateScrollViewContentOffSetWith:(NSInteger)offset{
    [self.scrollView setContentOffset:CGPointMake(offset * self.scrollView.width, 0) animated:YES];
    _pageIndex = (int)offset;
}

@end

