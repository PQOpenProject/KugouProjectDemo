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
 *  快速创建一个alertController 输入为空则不添加按钮
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
+ (nullable instancetype)pq_alertViewWithTitle:(nonnull NSString *)title message:(nonnull NSString *)message Cancel:(nullable NSString *)cancel other:(nullable NSString *)other cancelBlock:(nullable void(^)())cancelBlock otherBlock:(nullable void(^)())otherBlock;
/**
 *  得到一个可以让用户输入账号和密码的弹窗 输入为空则不添加按钮
 *
 *  @param title
 *  @param message
 *  @param cancel
 *  @param other
 *  @param cancelBlock
 *  @param otherBlock
 *
 *  @return alertController
 */
+ (nullable instancetype)pq_alertViewAccountAndPasswordWithTitle:(nonnull NSString *)title message:(nonnull NSString *)message Cancel:(nullable NSString *)cancel other:(nullable NSString *)other cancelBlock:(nullable void(^)())cancelBlock otherBlock:(nullable void(^)(NSString * _Nullable account, NSString * _Nullable password))otherBlock;
/**
 *  可以让用户输入文本的弹窗 输入为空则不添加按钮
 *
 *  @param title
 *  @param message
 *  @param cancel
 *  @param other
 *  @param cancelBlock
 *  @param otherBlock
 *
 *  @return
 */
+ (nullable instancetype)pq_alertViewInputTextWithTitle:(nonnull NSString *)title message:(nonnull NSString *)message Cancel:(nullable NSString *)cancel other:(nullable NSString *)other placeholder:(nullable NSString *)placeholder cancelBlock:(nullable void(^)())cancelBlock otherBlock:(nullable void(^)(NSString * _Nullable text))otherBlock;
@end
