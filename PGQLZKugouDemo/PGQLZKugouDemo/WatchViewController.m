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
    self.view2 = [PQTopTextBottomLineView pq_topTextBottomLineWithHeight:44 titles:@[@"新闻",@"Hot",@"社会",@"经济",@"科技",@"我去"] clickItem:^(NSString *string, NSInteger itemIndex) {
        
    }];
    [self.view addSubview:self.view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view2 pq_setSelectedItem:rand()%5];
    [self.view2 pq_updateTextColor:RANDOM_COLOR];
    [self.view2 pq_updateLineColor:RANDOM_COLOR];
    [self.view2 pq_updateTextSelectedColor:RANDOM_COLOR];
}


@end
