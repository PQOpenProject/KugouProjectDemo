//
//  UIAlertController+PQ_alertView.m
//  Bracelet
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 kct. All rights reserved.
//

#import "UIAlertController+PQ_alertView.h"

@implementation UIAlertController (PQ_alertView)
+ (instancetype)pq_alertViewWithTitle:(NSString *)title message:(NSString *)message Cancel:(NSString *)cancel other:(NSString *)other cancelBlock:(void (^)())cancelBlock otherBlock:(void (^)())otherBlock{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock();
    }];
    
    UIAlertAction * otherAction = [UIAlertAction actionWithTitle:other style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        otherBlock();
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    return alertController;
}
@end
