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
    self.view.backgroundColor = [UIColor clearColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"listen - %@",self.navigationController);
}

@end
