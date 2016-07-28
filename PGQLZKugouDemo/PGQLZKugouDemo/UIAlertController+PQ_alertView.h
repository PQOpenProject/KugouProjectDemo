//
//  UIAlertController+PQ_alertView.h
//  Bracelet
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 kct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (PQ_alertView)
/**
 *  快速创建一个alertController
 *
 *  @param title       标题
 *  @param message     信息
 *  @param cancel      取消
 *  @param other       其他
 *  @param cancelBlock 取消回调
 *  @param otherBlock  其他回调
 *
 *  @return alertController
 */
+ (instancetype)pq_alertViewWithTitle:(NSString *)title message:(NSString *)message Cancel:(NSString *)cancel other:(NSString *)other cancelBlock:(void(^)())cancelBlock otherBlock:(void(^)())otherBlock;

@end
