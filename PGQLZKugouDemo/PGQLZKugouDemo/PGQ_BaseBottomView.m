//
//  PGQ_BottomView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/25.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PGQ_BaseBottomView.h"
#import "UIView+pgqViewExtension.h"
@interface PGQ_BaseBottomView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *songLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *showListBtn;

@end

@implementation PGQ_BaseBottomView

- (void)awakeFromNib{
//    self.iconImage.height = self.iconImage.width;
    NSLog(@"%f %f",self.iconImage.width,self.iconImage.height);
    self.iconImage.layer.cornerRadius = self.iconImage.width/2;
    self.iconImage.clipsToBounds = YES;
}

+ (instancetype)pgqBaseBottomView{

    NSBundle *bundle=[NSBundle mainBundle];
    NSArray *objs=[bundle loadNibNamed:@"PGQ_BaseBottomView" owner:nil options:nil];
    return [objs lastObject];
    
}


@end
