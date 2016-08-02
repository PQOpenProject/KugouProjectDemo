//
//  PGQ_BottomView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/25.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PGQ_BaseBottomView.h"

#import "BasicHeader.h"

@interface PGQ_BaseBottomView ()


@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *songLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *showListBtn;

@end

@implementation PGQ_BaseBottomView

+ (instancetype)pgqBaseBottomView{

    NSBundle *bundle=[NSBundle mainBundle];
    NSArray *objs=[bundle loadNibNamed:@"PGQ_BaseBottomView" owner:nil options:nil];
    return [objs lastObject];
    
}
- (void)iconImage{
    self.iconImageView.image = [self.iconImageView.image circleImageWithBorderWidth:5 borderColor:[UIColor orangeColor]];
}
@end
