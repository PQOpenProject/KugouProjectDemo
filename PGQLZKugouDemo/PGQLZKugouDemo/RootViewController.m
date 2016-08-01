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
@interface RootViewController ()
/**
 *  顶部view
 */
@property (nonatomic,strong) PGQ_BaseTopView *topView;
/**
 *  底部view
 */
@property (nonatomic,strong) PGQ_BaseBottomView *bottomView;
/**
 *  中间view
 */
@property (nonatomic,strong) PGQ_BaseCenterView *centerView;
/**
 *  ViewModel
 */
@property (nonatomic,strong) BaseViewModel * baseVM;
@property (nonatomic,strong) SingViewController * singVC;
@property (nonatomic,strong) WatchViewController * watchVC;

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

- (PGQ_BaseBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [PGQ_BaseBottomView pgqBaseBottomView];
        _bottomView.width = PL_SRCEEN_WIDTH;
        _bottomView.y = self.view.bounds.size.height - 50;
    }
    return _bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化UI
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
            [self.singVC startTopScrollViewTimer];
        }else{
            [self.singVC closeTopScrollViewTimer];
        }
        
    }];
}

- (void)initUI{
    //增加背景
    [self updateForImageWithName:@"theme_default.jpg"];
    [self.view addSubview:self.topView];
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"SingStoryboard" bundle:nil];
    self.singVC = [storyBoard instantiateViewControllerWithIdentifier:@"singVC"];
    self.watchVC = [[WatchViewController alloc]init];
    ListenViewController *listenVC = [[ListenViewController alloc]init];
    
    self.centerView = [PGQ_BaseCenterView pgq_baseConterViewWithVCS:@[listenVC.view,self.watchVC.view,self.singVC.view] PageBlock:^(NSInteger pageIndex) {
        NSLog(@"scroll - pageindex %ld",pageIndex);
        [self.baseVM.scrollCommand execute:@(pageIndex)];
    }];
    [self.view addSubview:self.centerView];
    
    [self.view addSubview:self.bottomView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
