//
//  UINavigationBar+PQNavBarExtension.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/3.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "UINavigationBar+PQNavBarExtension.h"
#import <objc/message.h>
@interface UINavigationBar ()

@property (nonatomic,strong) UIView * pq_navigationBarBackround;

@end

@implementation UINavigationBar (PQNavBarExtension)


static const char * pq_navigationBarBackgournd_KEY = "pq_navigationBarBackgournd_KEY";
static const char * pq_isShowNavigationBackgound_KEY = "pq_isShowNavigationBackgound_KEY";
static const char * pq_BarBackgroundColor_KEY = "pq_BarBackgroundColor_KEY";


- (void)setPq_isShowBGClolor:(BOOL)pq_isShowBGClolor{
    if (pq_isShowBGClolor == YES) {
        [self pq_addNavigationBarBackground];
    }else{
        [self pq_removeNavigationBarBackgound];
    }
    objc_setAssociatedObject(self, pq_isShowNavigationBackgound_KEY, @(pq_isShowBGClolor), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setPq_navigationBarBackround:(UIView *)pq_navigationBarBackround{
    if (pq_navigationBarBackround) {
        objc_setAssociatedObject(self, pq_navigationBarBackgournd_KEY, pq_navigationBarBackround, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)setPq_BarBackgroundColor:(CGFloat)pq_BarBackgroundColor{
    
    if (!self.pq_navigationBarBackround) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
                self.pq_navigationBarBackround = view;
            }
        }
    }
    self.pq_navigationBarBackround.alpha = pq_BarBackgroundColor;
    objc_setAssociatedObject(self, pq_BarBackgroundColor_KEY, @(pq_BarBackgroundColor), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)pq_navigationBarBackround{
    return objc_getAssociatedObject(self, pq_navigationBarBackgournd_KEY);
}

- (BOOL)pq_isShowBGClolor{
    return [objc_getAssociatedObject(self, pq_isShowNavigationBackgound_KEY) boolValue];
}

- (CGFloat)pq_BarBackgroundColor{
   return [objc_getAssociatedObject(self, pq_BarBackgroundColor_KEY) floatValue];
}



- (void)pq_addNavigationBarBackground{
    
    BOOL isHas = NO;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            isHas = YES;
        }
    }
    if (!isHas) {
        if (self.pq_navigationBarBackround) {
            [self addSubview:self.pq_navigationBarBackround];
        }
    }
}

- (void)pq_removeNavigationBarBackgound{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            if (!self.pq_navigationBarBackround) {
                self.pq_navigationBarBackround = view;
            }
            [view removeFromSuperview];
        }
    }
}

- (void)setNavigationBarBackgroundColor:(UIColor *)color{
    self.pq_navigationBarBackround.backgroundColor = color;
}

@end
