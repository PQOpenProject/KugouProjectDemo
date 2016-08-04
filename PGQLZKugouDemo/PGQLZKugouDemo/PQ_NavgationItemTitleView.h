//
//  PQ_NavgationItemTitleView.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/4.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PQTopTextBottomLineView;
@interface PQ_NavgationItemTitleView : UIView
@property (nonatomic,strong) PQTopTextBottomLineView * centerView;
/**
 *  创建一个view
 *
 *  @param frame
 *  @param block
 *  @param iconSearchBlock
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame lickIndex:(void(^)(NSInteger index))block iconOrSearch:(void(^)(BOOL isIcon))iconSearchBlock;
/**
 *  更新头像
 *
 *  @param image
 */
- (void)pq_updateIconButtonImage:(UIImage *)image;
/**
 *  更新背景透明度
 *
 *  @param alpha
 */
- (void)pq_updateBlueBackgournd:(CGFloat)alpha;
@end
