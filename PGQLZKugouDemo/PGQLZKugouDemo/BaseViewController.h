//
//  BaseViewController.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PQ_NavgationItemTitleView;
@class BaseViewModel;
@interface BaseViewController : UIViewController
@property (nonatomic,strong) PQ_NavgationItemTitleView * navItemTitleView;
//把VM公开
@property (nonatomic,strong) BaseViewModel * baseVM;
/**
 *  更新背景图片
 *
 *  @param imgName
 */
- (void)updateForImageWithName:(NSString *)imgName;

//- (void)scrollToIndex:(NSInteger)index;


@end
