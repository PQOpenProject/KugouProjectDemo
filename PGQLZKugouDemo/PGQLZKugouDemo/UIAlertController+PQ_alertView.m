//
//  UIAlertController+PQ_alertView.m
//  Bracelet
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 kct. All rights reserved.
//

#import "UIAlertController+PQ_alertView.h"

@implementation UIAlertController (PQ_alertView)
+ (nullable instancetype)pq_alertViewWithTitle:(nonnull NSString *)title message:(nonnull NSString *)message Cancel:(nullable NSString *)cancel other:(nullable NSString *)other cancelBlock:(nullable void(^)())cancelBlock otherBlock:(nullable void(^)())otherBlock{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancel) {
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelBlock();
        }];
        [alertController addAction:cancelAction];
    }
    
    if (other) {
        UIAlertAction * otherAction = [UIAlertAction actionWithTitle:other style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            otherBlock();
        }];
        [alertController addAction:otherAction];
    }
    
    return alertController;
}

+ (nullable instancetype)pq_alertViewAccountAndPasswordWithTitle:(nonnull NSString *)title message:(nonnull NSString *)message Cancel:(nullable NSString *)cancel other:(nullable NSString *)other cancelBlock:(nullable void(^)())cancelBlock otherBlock:(nullable void(^)(NSString * _Nullable account, NSString * _Nullable password))otherBlock{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancel) {
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelBlock();
        }];
        [alertController addAction:cancelAction];
    }
    
    if (other) {
        UIAlertAction * otherAction = [UIAlertAction actionWithTitle:other style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            UITextField * account = alertController.textFields.firstObject;
            UITextField * password = alertController.textFields.lastObject;
            otherBlock(account.text,password.text);
        }];
        [alertController addAction:otherAction];
    }
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"账号";
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = !textField.secureTextEntry;
    }];
    
    return alertController;
}

+ (nullable instancetype)pq_alertViewInputTextWithTitle:(nonnull NSString *)title message:(nonnull NSString *)message Cancel:(nullable NSString *)cancel other:(nullable NSString *)other placeholder:(nullable NSString *)placeholder cancelBlock:(nullable void(^)())cancelBlock otherBlock:(nullable void(^)(NSString * _Nullable text))otherBlock{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancel) {
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelBlock();
        }];
        [alertController addAction:cancelAction];
    }
    
    if (other) {
        UIAlertAction * otherAction = [UIAlertAction actionWithTitle:other style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            UITextField * textField = alertController.textFields.firstObject;
            otherBlock(textField.text);
        }];
        [alertController addAction:otherAction];
    }
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    
    return alertController;
}
@end
