//
//  WatchViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "WatchViewController.h"
#import "BasicHeader.h"
@interface WatchViewController ()

@end

@implementation WatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];
    view.backgroundColor = [UIColor orangeColor];
    view.alpha = 0.8;
    
    //毛玻璃效果
    [self.view frostedglassStyle:UIBlurEffectStyleDark];
    self.view.alpha = 0.98;
//    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
