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
 *  中间view
 */
@property (nonatomic,strong) PGQ_BaseCenterView *centerView;
/**
 *  ViewModel
 */
@property (nonatomic,strong) RootViewModel * rootVM;
@property (nonatomic,strong) SingTwoViewController * singVC2;
@property (nonatomic,strong) WatchViewController * watchVC;
@property (nonatomic,strong) ListenViewController *listenVC;
@property (nonatomic,assign) NSInteger showIndexPage;
@end

@implementation RootViewController
//懒方法 lazy method
- (RootViewModel *)rootVM{
    if (!_rootVM) {
        _rootVM = [[RootViewModel alloc]init];
    }
    return _rootVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor orangeColor];
    [self initUI];
    //处理事件
    [self event];
}

- (void)event{
    //不管是谁发送了消息都相应的的更新
    [self.rootVM.scrollCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        
        NSLog(@"%@ %@",self.navItemTitleView.centerView,[NSThread currentThread]);
        [self.navItemTitleView.centerView pq_setSelectedItem:[x integerValue]];
        [self.centerView updateScrollViewContentOffSetWith:[x integerValue]];
        
        if ([x integerValue] == 2) {
            [self.singVC2 startTopScrollViewTimer];
        }else{
            [self.singVC2 closeTopScrollViewTimer];
        }
    }];
    
    [self.baseVM.IconOrSearchCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        //滑到指定的页面
        if ([x boolValue]) {
            NSLog(@"点击了头像");
        }
        else{
            NSLog(@"点击了搜索");
        }
    }];
    [self.baseVM.centerViewCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        [self.rootVM.scrollCommand execute:x];
    }];
}

- (void)initUI{
    //增加背景
    [self updateForImageWithName:@"theme_default.jpg"];
    //create VC
    
    self.listenVC = [[ListenViewController alloc] init];
    [self addChildViewController:self.listenVC];
    
    UIStoryboard *storyBoard1=[UIStoryboard storyboardWithName:@"WatchViewController" bundle:nil];
    self.watchVC = [storyBoard1 instantiateViewControllerWithIdentifier:@"watchVC"];
    [self addChildViewController:self.watchVC];
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"SingStoryboard" bundle:nil];
    self.singVC2 = [storyBoard instantiateViewControllerWithIdentifier:@"singVC2"];
    [self addChildViewController:self.singVC2];
    //添加
    self.centerView = [PGQ_BaseCenterView pgq_baseConterViewWithVCS:@[self.listenVC,self.watchVC,self.singVC2] PageBlock:^(NSInteger pageIndex) {
        //更新
        _showIndexPage = pageIndex;
        [self.rootVM.scrollCommand execute:@(pageIndex)];
    } offSet:^(CGFloat offset) {
        if (offset < 0) {
            NSLog(@"...%f",1 - fabs(offset) +0.5);
            [self.navItemTitleView pq_updateBlueBackgournd:1];
        }
        if (offset < 1) {
            [self.navItemTitleView pq_updateBlueBackgournd:offset];
        }
//        NSLog(@"%f",offset);
    }];
    [self.view addSubview:self.centerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
