//
//  ListenViewController.m
//  ;
//
//  Created by Liuzhen on 16/7/28.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "ListenViewController.h"
#import "BasicHeader.h"
@implementation ListenViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PL_SRCEEN_WIDTH, 200)];
    
    [self.view addSubview:view];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"listen - %@",self.navigationController);
}

@end
