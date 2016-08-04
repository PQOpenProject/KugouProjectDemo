//
//  BaseViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "BaseViewController.h"
#import "RootViewController.h"
#import "BasicHeader.h"
#import "BaseHeader.h"
#import "UIImage+ImageEffects.h"
@interface BaseViewController ()
@property (nonatomic,strong) UIImageView * backgroundIMG;
@end

@implementation BaseViewController

- (BaseViewModel *)baseVM{
    if (!_baseVM) {
        _baseVM = [[BaseViewModel alloc] init];
    }
    return _baseVM;
}

static const NSString * NOTIFACATION_SCROLL = @"liandongSCROOL";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (_navItemTitleView == nil) {
        _navItemTitleView = [[PQ_NavgationItemTitleView alloc] initWithFrame:CGRectMake(0, -20, PL_SRCEEN_WIDTH, 64) lickIndex:^(NSInteger index) {
            [self.baseVM.centerViewCommand execute:@(index)];
        } iconOrSearch:^(BOOL isIcon) {
            [self.baseVM.IconOrSearchCommand execute:@(isIcon)];
        }];
    }
    if (self.navigationController.navigationBar.subviews.count <=1) {
        [self.navigationController.navigationBar addSubview:_navItemTitleView];
    }
    
}


//模糊图片处理
- (void)updateForImageWithName:(NSString *)imgName{
    self.backgroundIMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, PL_SRCEEN_WIDTH, 244)];
    self.backgroundIMG.userInteractionEnabled = YES;
    self.backgroundIMG.image = [[UIImage imageNamed:imgName] blurImageAtFrame:CGRectMake(0, 84, PL_SRCEEN_WIDTH, 244)];
    [self.view addSubview:self.backgroundIMG];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
