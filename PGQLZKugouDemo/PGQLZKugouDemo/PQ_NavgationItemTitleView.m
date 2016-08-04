//
//  PQ_NavgationItemTitleView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/4.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PQ_NavgationItemTitleView.h"
#import "BasicHeader.h"
typedef void(^PQ_NAVBlock)(NSInteger index);
typedef void(^PQ_ISBlock)(BOOL isIcon);

@interface PQ_NavgationItemTitleView ()

@property (nonatomic,copy) PQ_NAVBlock saveBlock;
@property (nonatomic,copy) PQ_ISBlock iconSearhBlock;
@property (nonatomic,strong) UIButton * iconBtn;
@property (nonatomic,strong) UIButton * searchBtn;
@property (nonatomic,weak) UILabel * backgroundLabel;
@end

@implementation PQ_NavgationItemTitleView

- (instancetype)initWithFrame:(CGRect)frame lickIndex:(void(^)(NSInteger index))block iconOrSearch:(void(^)(BOOL isIcon))iconSearchBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.saveBlock = block;
        self.iconSearhBlock = iconSearchBlock;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.iconBtn = [self buttonWithimageName:@"fx_kglive_viewer_default" tag:0];
    self.iconBtn.width *= 0.5;
    self.iconBtn.height = self.iconBtn.width;
    self.iconBtn.layer.cornerRadius = self.iconBtn.width*0.5;
    self.iconBtn.clipsToBounds = YES;
    self.iconBtn.center = CGPointMake(30, 42);
    self.searchBtn = [self buttonWithimageName:@"colorring_search" tag:3];
    self.searchBtn.width *= 0.5;
    self.searchBtn.height = self.iconBtn.width;
    self.searchBtn.center = CGPointMake(0, 42);
    self.searchBtn.x = self.width - self.searchBtn.width - 10;
    self.centerView = [PQTopTextBottomLineView pq_topTextBottomLineWithHeight:CGRectMake(PL_SRCEEN_WIDTH*0.2  , 20, (PL_SRCEEN_WIDTH) * 0.6, 44) titles:@[@"听",@"看",@"唱"] clickItem:^(NSString *string, NSInteger itemIndex) {
        NSLog(@"%@",string);
        self.saveBlock(itemIndex);
    }];
    [self.centerView pq_updateLineColor:[UIColor whiteColor]];
    [self.centerView pq_updateTextColor:[UIColor blackColor]];
    [self.centerView pq_updateTextSelectedColor:[UIColor whiteColor]];
//    self.centerView.backgroundColor = [UIColor blueColor];
    
    
    UILabel * bLabel = [[UILabel alloc]initWithFrame:self.bounds];
    self.backgroundLabel = bLabel;
    self.backgroundLabel.backgroundColor = PL_COLORRGBA(4, 77, 255, 1);
    self.backgroundLabel.alpha = 0;
    [self addSubview:bLabel];
    
    [self addSubview:self.iconBtn];
    [self addSubview:self.searchBtn];
    [self addSubview:self.centerView];
}

- (UIButton *)buttonWithimageName:(NSString *)imageName tag:(NSInteger)tag{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(tag * PL_SRCEEN_WIDTH, 20, PL_SRCEEN_WIDTH / 6, 44);
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.tag = tag;
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        if (btn.tag == 0) {
            self.iconSearhBlock(YES);
        }
        else{
            self.iconSearhBlock(NO);
        }
    }];
    return btn;
}
- (void)pq_updateIconButtonImage:(UIImage *)image{
    [self.iconBtn setImage:image forState:UIControlStateNormal];
}
- (void)pq_updateBlueBackgournd:(CGFloat)alpha;{
    self.backgroundLabel.alpha = alpha;
}
@end
