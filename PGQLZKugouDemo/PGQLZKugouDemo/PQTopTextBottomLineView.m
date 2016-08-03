//
//  PQTopTextBottomLineView.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/2.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PQTopTextBottomLineView.h"
#import "BasicHeader.h"
@interface PQTopTextBottomLineView ()

@property (nonatomic,strong) NSArray * titles;
@property (nonatomic,strong) NSMutableArray * buttons;
@property (nonatomic,strong) UIButton * lastButton;
@property (nonatomic,strong) UILabel * lineLabel;
@end

@implementation PQTopTextBottomLineView

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - 3,  self.width/self.titles.count, 2)];
        _lineLabel.backgroundColor = [UIColor blueColor];
    }
    return _lineLabel;
}

- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

+ (instancetype)pq_topTextBottomLineWithHeight:(CGFloat)height titles:(NSArray *)titles clickItem:(void(^)(NSString * string,NSInteger itemIndex))block{
    PQTopTextBottomLineView * ttbl = [[PQTopTextBottomLineView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ((height < 44) ? 44:height))];
    ttbl.titles = titles;
    [ttbl setUp:block];
    return ttbl;
}

- (void)setUp:(void(^)(NSString * string,NSInteger itemIndex))block{
    CGFloat widthBtn = PL_SRCEEN_WIDTH / self.titles.count;
    for (NSInteger i = 0; i < self.titles.count; i++) {
        UIButton * button = [self createButtonWithTitle:self.titles[i] frame:CGRectMake(i * widthBtn, 0, widthBtn, 44) tag:i];
        if (i == 0) {
            button.selected = YES;
            _lastButton = button;
        }
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            if (_lastButton.tag == button.tag) {
                return ;
            }
            if (button.selected == YES) {
                return;
            }
            //把上个按钮状态置为没选择
            _lastButton.selected = NO;
            button.selected = YES;
            _lastButton = button;
            block(button.titleLabel.text,button.tag);
        }];
        [self addSubview:button];
        
        //加入到数组中
        [self.buttons addObject:button];
    }
    [self addSubview:self.lineLabel];
}

- (UIButton *)createButtonWithTitle:(NSString *)title frame:(CGRect)frame tag:(NSInteger)tag{
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = tag;
    [RACObserve(button, selected) subscribeNext:^(id x) {
        if (button.selected == YES) {
            [UIView animateWithDuration:0.25f animations:^{
                self.lineLabel.x = button.x;
                button.transform = CGAffineTransformMakeScale(1.1, 1.1);
            }];
        }
        else{
            button.transform = CGAffineTransformMakeScale(1, 1);
        }
    }];
    return button;
}

- (void)pq_setSelectedItem:(NSInteger)index{
    [UIView animateWithDuration:0.25f animations:^{
        UIButton * button = self.buttons[index];
        _lastButton.selected = NO;
        button.selected = YES;
        _lastButton = button;
    }];
}

- (void)pq_updateLineColor:(UIColor *)lineColor;{
    self.lineLabel.backgroundColor = lineColor;
}

/**
 *  更新文字颜色
 *
 *  @param textColor
 */
- (void)pq_updateTextColor:(UIColor *)textColor{
    for (UIButton * btn in self.buttons) {
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    }
}
/**
 *  更新文字选中时颜色
 *
 *  @param textColor
 */
- (void)pq_updateTextSelectedColor:(UIColor *)textColor{
    for (UIButton * btn in self.buttons) {
        [btn setTitleColor:textColor forState:UIControlStateSelected];
    }
}

@end
