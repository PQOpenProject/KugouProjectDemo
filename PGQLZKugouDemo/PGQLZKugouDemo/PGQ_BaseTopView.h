//
//  PGQ_BaseTopView.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/25.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PGQ_BaseTopViewClickBlock)(UIButton * button ,NSInteger tag);
typedef void(^PGQ_BaseTopViewIconBlock)(UIButton * button ,NSInteger tag);
typedef void(^PGQ_BaseTopViewSearchBlock)(UIButton * button ,NSInteger tag);

@interface PGQ_BaseTopView : UIView

/**
 *  创建一个头视图
 *
 *  @param clickBlock
 *
 *  @return
 */
+ (instancetype)pgq_BaseTopViewWithEvent:(PGQ_BaseTopViewClickBlock)clickBlock icon:(PGQ_BaseTopViewIconBlock)icon search:(PGQ_BaseTopViewSearchBlock)block;

/**
 *  更新图片
 *
 *  @param image
 */
- (void)updateUserIconWithImage:(UIImage *)image;
/**
 *  更新图片
 *
 *  @param imageNamed 
 */
- (void)updateUserIconWithImageNamed:(NSString *)imageNamed;
/**
 *  更新按钮是不是选中
 *
 *  @param index 
 */
- (void)updateUserSelectedWithIndex:(NSInteger)index;
@end
