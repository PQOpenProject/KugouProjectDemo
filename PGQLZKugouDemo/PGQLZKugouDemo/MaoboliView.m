//
//  MaoboliView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "MaoboliView.h"

@implementation MaoboliView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
}

+ (instancetype)maobuliWithView:(UIView*)view type:(MaoBoliTYpe)type{
    MaoboliView * maobuli = [[self alloc]init];
    
    /*
     毛玻璃的样式(枚举)
     UIBlurEffectStyleExtraLight,
     UIBlurEffectStyleLight,
     UIBlurEffectStyleDark
     */
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = view.frame;
    [view addSubview:effectView];
    
    return maobuli;
}



@end
