//
//  PGQ_BaseTopView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/25.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PGQ_BaseTopView.h"
#import "BasicHeader.h"
#import "UIImage+pgqImageExtension.h"

@interface PGQ_BaseTopView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIButton * iconBtn;
@property (nonatomic,strong) UIButton * lastBtn;
@property (nonatomic,strong) NSMutableArray * buttons;

@property (nonatomic,copy) PGQ_BaseTopViewClickBlock clickBlock;

@property (nonatomic,copy) PGQ_BaseTopViewIconBlock iconBblock;
@property (nonatomic,copy) PGQ_BaseTopViewSearchBlock searchBlock;
@end

@implementation PGQ_BaseTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttons = [NSMutableArray array];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    NSArray * titles = @[@"",@"听",@"看",@"唱",@""];
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width/5, self.height*0.8)];
    UIButton *btn = [self buttonWithimageName:@"default_headIcon" tag:1101];
    [view1 addSubview:btn];
    [self addSubview:view1];
    
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(4 * (self.width/5), 0, self.width/5, self.height*0.8)];
    UIButton *btn2 = [self buttonWithimageName:@"colorring_search" tag:1102];
    [view2 addSubview:btn2];
    [self addSubview:view2];
    for (NSInteger i = 1; i < 4; i++) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(i * (self.width/5), 0, self.width/5, self.height*0.8)];
        UIButton *btn = [self buttonWithTag:i text:titles[i]];
            [view addSubview:btn];
        [self addSubview:view];
        [self.buttons addObject:view];
    }
}

- (UIButton *)buttonWithTag:(NSInteger)tag text:(NSString *)textName{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, self.height*0.1, self.height*0.8, self.height*0.8);
    [btn setTitle:textName forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.tag = tag-1;
    if (tag == 1) {
        btn.selected = YES;
        self.lastBtn = btn;
    }
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        self.lastBtn.selected = !self.lastBtn.selected;
        btn.selected = YES;
        self.lastBtn = btn;
        self.clickBlock(btn,btn.tag);
    }];
    
    [RACObserve(btn, selected) subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            [UIView animateWithDuration:0.25f animations:^{
                btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }];
        }
        else{
            [UIView animateWithDuration:0.25f animations:^{
                btn.transform = CGAffineTransformIdentity;
            }];
        }
    }];
    return btn;
}


- (UIButton *)buttonWithimageName:(NSString *)imageName tag:(NSInteger)tag{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.height*0.6, self.height*0.2, self.height*0.6, self.height*0.6);
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.tag = tag;
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        if (btn.tag == 1101) {
            self.iconBblock(btn,btn.tag);
        }else
            self.searchBlock(btn,btn.tag);
    }];
    return btn;
}


- (void)updateUserIconWithImage:(UIImage *)image{
    [[self.subviews firstObject] setValue:image forKey:@"image"];
}
- (void)updateUserIconWithImageNamed:(NSString *)imageNamed{
    [[self.subviews firstObject] setValue:[UIImage imageNamed:imageNamed] forKey:@"image"];
}
- (void)updateUserSelectedWithIndex:(NSInteger)index{
    _lastBtn.selected = !_lastBtn.selected;
    UIButton * btn = [self.buttons[index] subviews][0];
    btn.selected = YES;
    _lastBtn = btn;
    
}

+ (instancetype)pgq_BaseTopViewWithEvent:(PGQ_BaseTopViewClickBlock)clickBlock icon:(PGQ_BaseTopViewIconBlock)icon search:(PGQ_BaseTopViewSearchBlock)block{
    PGQ_BaseTopView * topView = [[PGQ_BaseTopView alloc]initWithFrame:CGRectMake(0, 20, PL_SRCEEN_WIDTH, 44)];
    topView.clickBlock = clickBlock;
    topView.iconBblock = icon;
    topView.searchBlock = block;

    return topView;
}
@end
