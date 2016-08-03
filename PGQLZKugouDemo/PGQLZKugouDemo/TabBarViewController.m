//
//  TabBarViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/3.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "TabBarViewController.h"
#import "BasicHeader.h"
#import "BaseHeader.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (PGQ_BaseBottomView *)tabbarView{
    if (!_tabbarView) {
        _tabbarView = [PGQ_BaseBottomView pgqBaseBottomView];
        _tabbarView.width = PL_SRCEEN_WIDTH;
        _tabbarView.y = 49 - _tabbarView.height;
    }
    return _tabbarView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RootViewController *root = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
    [self addChildViewController:nav];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tabBar bringSubviewToFront:self.tabbarView];
    [self.tabBar addSubview:_tabbarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
