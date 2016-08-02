//
//  PQTopTextBottomLineView.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/2.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQTopTextBottomLineView : UIView

+ (instancetype)pq_topTextBottomLineWithHeight:(CGFloat)height titles:(NSArray *)titles clickItem:(void(^)(NSString * string,NSInteger itemIndex))block;

- (void)pq_setSelectedItem:(NSInteger)index;

@end
