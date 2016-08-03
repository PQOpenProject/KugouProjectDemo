//
//  PQTopTextBottomLineView.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/2.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQTopTextBottomLineView : UIView
/**
 *  快速创建一个上面是字下面是一条带颜色的label，带有动画效果
 *
 *  @param height
 *  @param titles
 *  @param block
 *
 *  @return
 */
+ (instancetype)pq_topTextBottomLineWithHeight:(CGFloat)height titles:(NSArray *)titles clickItem:(void(^)(NSString * string,NSInteger itemIndex))block;
/**
 *  调到指定的项 下标从0开始
 *
 *  @param index
 */
- (void)pq_setSelectedItem:(NSInteger)index;
/**
 *  更新线颜色
 *
 *  @param lineColor
 */
- (void)pq_updateLineColor:(UIColor *)lineColor;
/**
 *  更新文字颜色
 *
 *  @param textColor
 */
- (void)pq_updateTextColor:(UIColor *)textColor;
/**
 *  更新文字选中时颜色
 *
 *  @param textColor 
 */
- (void)pq_updateTextSelectedColor:(UIColor *)textColor;
@end
