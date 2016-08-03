//
//  SingTwoViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "SingTwoViewController.h"
#import "SingHeader.h"
@interface SingTwoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) SingHeadView * headView ;

@end
static  NSString * const identifier = @"SING_TWOCELL";
@implementation SingTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SingTwoTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
    [_headView startTopScrollViewTimer];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_headView closeTopScrollViewTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startTopScrollViewTimer{
    [self.headView startTopScrollViewTimer];
}
- (void)closeTopScrollViewTimer{
    [self.headView closeTopScrollViewTimer];
}

#pragma mark - tableView delegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SingTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.headView == nil) {
        self.headView = [SingHeadView singHeadViewForNib];
        [self headerViewEvent];
    }
    return self.headView;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 330;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了大赛");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 330;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:nil ];
}

// tap event{
- (void)headerViewEvent{
    [self.headView scrollViewClickItem:^(NSInteger item) {
        NSLog(@"在唱页面点击了 scrollview - %ld",item);
    }];
    
    [self.headView bodyViewClickItem:^(NSInteger item) {
        NSLog(@"在唱页面点击了 body - %ld",item);
        
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"sing - %@",self.navigationController);
}

@end
