//
//  UINavigationBar+PQNavBarExtension.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/3.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (PQNavBarExtension)

@property (nonatomic,assign) BOOL pq_isShowBGClolor;

@property (nonatomic,assign) CGFloat pq_BarBackgroundColor;

- (void)setNavigationBarBackgroundColor:(UIColor *)color;
@end
