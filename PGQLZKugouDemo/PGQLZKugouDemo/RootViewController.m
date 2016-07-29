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

@property (nonatomic,strong) PGQ_SingViewController * singVC;

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
    self.view.backgroundColor = [UIColor orangeColor];
    //初始化UI
    [self initUI];
    //处理事件
    [self event];
    
    
//    UIAlertController * ac = [UIAlertController pq_alertViewWithTitle:@"提示" message:@"哈哈" Cancel:nil other:@"确定" cancelBlock:nil otherBlock:^{
//        NSLog(@"你看看");
//    }];
//    [self presentViewController:ac animated:YES completion:nil];
    
//    UIAlertController * ac1 = [UIAlertController pq_alertViewAccountAndPasswordWithTitle:@"提示" message:@"请输入用户名和密码" Cancel:@"取消" other:@"确定" cancelBlock:^{
//        NSLog(@"cancel");
//    } otherBlock:^(NSString * _Nullable account, NSString * _Nullable password) {
//        NSLog(@"%@ %@",account,password);
//    }];
//    [self presentViewController:ac1 animated:YES completion:nil];
    
    
    UIAlertController * ac2 = [UIAlertController pq_alertViewInputTextWithTitle:@"您好" message:@"请输入您的昵称" Cancel:nil other:@"确定" placeholder:@"比如：王尼玛" cancelBlock:nil otherBlock:^(NSString * _Nullable text) {
        NSLog(@"%@",text);
    }];
    [self presentViewController:ac2 animated:YES completion:nil];
    
}

- (void)event{
    //不管是谁发送了消息都相应的的更新
    [self.baseVM.scrollCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        [self.topView updateUserSelectedWithIndex:[x integerValue]];
        [self.centerView updateScrollViewContentOffSetWith:[x integerValue]];
    }];
}

- (void)initUI{
    [self.view addSubview:self.topView];
    
    
     self.singVC = [[PGQ_SingViewController alloc] initWithNibName:@"PGQ_SingViewController" bundle:nil];
    
    UIViewController * controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor greenColor];

//    UIViewController * controller3 = [[UIViewController alloc] init];
//    controller3.view.backgroundColor = [UIColor redColor];
    //Listen VC
    ListenViewController *listenVC = [[ListenViewController alloc]init];
    listenVC.view.backgroundColor = [UIColor whiteColor];
    
    self.centerView = [PGQ_BaseCenterView pgq_baseConterViewWithVCS:@[listenVC.view,controller2.view,self.singVC.view] PageBlock:^(NSInteger pageIndex) {
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ - 接收到touce",self);
}


@end
