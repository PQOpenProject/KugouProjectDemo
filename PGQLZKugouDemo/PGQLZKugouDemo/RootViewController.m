//
//  ViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/22.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "RootViewController.h"
#import "BasicHeader.h"
#import "BaseHeader.h"
#import "SingHeader.h"
@interface RootViewController ()
/**
 *  顶部view
 */
@property (nonatomic,strong) PGQ_BaseTopView *topView;
/**
 *  中间view
 */
@property (nonatomic,strong) PGQ_BaseCenterView *centerView;
/**
 *  ViewModel
 */
@property (nonatomic,strong) BaseViewModel * baseVM;
@property (nonatomic,strong) SingTwoViewController * singVC2;
@property (nonatomic,strong) WatchViewController * watchVC;
@property (nonatomic,strong) ListenViewController *listenVC;
@end

@implementation RootViewController
//懒方法 lazy method
- (BaseViewModel *)baseVM{
    if (!_baseVM) {
        _baseVM = [[BaseViewModel alloc]init];
    }
    return _baseVM;
}

- (PGQ_BaseTopView *)topView{
    if (!_topView) {
        _topView = [PGQ_BaseTopView pgq_BaseTopViewWithEvent:^(UIButton *button, NSInteger tag) {
            [self.baseVM.scrollCommand execute:@(tag)];
        } icon:^(UIButton *button, NSInteger tag) {
            NSLog(@"icon");
        } search:^(UIButton *button, NSInteger tag) {
            NSLog(@"search");
        }];
    }
    return _topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    //处理事件
    [self event];
}

- (void)event{
    //不管是谁发送了消息都相应的的更新
    [self.baseVM.scrollCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        [self.topView updateUserSelectedWithIndex:[x integerValue]];
        [self.centerView updateScrollViewContentOffSetWith:[x integerValue]];
        
        if ([x integerValue] == 2) {
            [self.singVC2 startTopScrollViewTimer];
        }else{
            [self.singVC2 closeTopScrollViewTimer];
        }
    }];
}

- (void)initUI{
    //增加背景
    [self updateForImageWithName:@"theme_default.jpg"];
    [self.view addSubview:self.topView];
    //create VC
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"SingStoryboard" bundle:nil];
    
    self.listenVC = [[ListenViewController alloc] init];
    [self addChildViewController:self.listenVC];
    
    self.watchVC = [[WatchViewController alloc] init];
    [self addChildViewController:self.watchVC];
    
    self.singVC2 = [storyBoard instantiateViewControllerWithIdentifier:@"singVC2"];
    [self addChildViewController:self.singVC2];
    //添加
    self.centerView = [PGQ_BaseCenterView pgq_baseConterViewWithVCS:@[self.listenVC,self.watchVC,self.singVC2] PageBlock:^(NSInteger pageIndex) {
        //更新
        [self.baseVM.scrollCommand execute:@(pageIndex)];
    }];
    [self.view addSubview:self.centerView];
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
