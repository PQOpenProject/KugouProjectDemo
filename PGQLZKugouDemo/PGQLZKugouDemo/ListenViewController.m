//
//  ListenViewController.m
//  PGQLZKugouDemo
//
//  Created by Liuzhen on 16/7/28.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "ListenViewController.h"

@implementation ListenViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.8;
    [self.view addSubview:view];
}


@end
