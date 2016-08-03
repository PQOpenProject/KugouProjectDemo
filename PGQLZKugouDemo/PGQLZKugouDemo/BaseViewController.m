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
#import "UIImage+ImageEffects.h"
@interface BaseViewController ()
@property (nonatomic,strong) UIImageView * backgroundIMG;
@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
//模糊图片处理
- (void)updateForImageWithName:(NSString *)imgName{
    self.backgroundIMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, PL_SRCEEN_WIDTH, 244)];
    self.backgroundIMG.image = [[UIImage imageNamed:imgName] blurImageAtFrame:CGRectMake(0, 84, PL_SRCEEN_WIDTH, 244)];
    [self.view addSubview:self.backgroundIMG];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
