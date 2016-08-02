//
//  SingHeadView.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SingHeadScrollBlock)(NSInteger item);
typedef void(^SingHeadBodyBlock)(NSInteger item);

@interface SingHeadView : UIView

+ (instancetype)singHeadViewForNib;

//public
- (void)startTopScrollViewTimer;
- (void)closeTopScrollViewTimer;

- (void)scrollViewClickItem:(SingHeadScrollBlock)block;
- (void)bodyViewClickItem:(SingHeadBodyBlock)block;

@end
