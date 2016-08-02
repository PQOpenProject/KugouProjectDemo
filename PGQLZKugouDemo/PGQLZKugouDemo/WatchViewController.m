//
//  WatchViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "WatchViewController.h"
#import "BasicHeader.h"

#import "PQTopTextBottomLineView.h"

@interface WatchViewController ()
@property (nonatomic,strong) PQTopTextBottomLineView * view2;
@end

@implementation WatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];
    view.backgroundColor = [UIColor orangeColor];
    view.alpha = 0.8;

    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"watch - %@",self.navigationController);
}


@end
