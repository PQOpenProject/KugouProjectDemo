//
//  MaoboliView.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ONE = 0,
    TWO,
    THREE,
} MaoBoliTYpe;

@interface MaoboliView : UIView

+ (instancetype)maobuliWithView:(UIView*)view type:(MaoBoliTYpe)type;

@end
