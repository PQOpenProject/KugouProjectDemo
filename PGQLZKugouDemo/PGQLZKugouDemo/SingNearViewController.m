//
//  SingNearViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/3.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "SingNearViewController.h"
#import "SingHeader.h"
#import "BasicHeader.h"
@interface SingNearViewController ()
@property (nonatomic,strong) PQTopTextBottomLineView * view2;
@end

@implementation SingNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    
    self.view2 = [PQTopTextBottomLineView pq_topTextBottomLineWithHeight:44 titles:@[@"礼物榜",@"离我最近",@"最新上传"] clickItem:^(NSString *string, NSInteger itemIndex) {
        
    }];
    self.view2.y = 64;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.view2];
    NSString * path = KG_SEARCH(@"追梦赤子心", @"1", @"20");
    NSLog(@"%@",path);
}


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view2 pq_setSelectedItem:rand()%3];
    [self.view2 pq_updateTextColor:RANDOM_COLOR];
    [self.view2 pq_updateLineColor:RANDOM_COLOR];
    [self.view2 pq_updateTextSelectedColor:RANDOM_COLOR];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
