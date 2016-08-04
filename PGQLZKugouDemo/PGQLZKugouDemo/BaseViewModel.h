//
//  BaseViewModel.h
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/4.
//  Copyright © 2016年 PL. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACCommand;
@class RACSignal;
@interface BaseViewModel : NSObject

@property (nonatomic,assign) NSInteger centerSelectedIndex;
@property (nonatomic,assign) BOOL isIconSelected;

@property (nonatomic,strong) RACCommand *centerViewCommand;
@property (nonatomic,strong) RACCommand *IconOrSearchCommand;

@end
