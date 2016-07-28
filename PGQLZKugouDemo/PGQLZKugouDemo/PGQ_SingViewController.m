//
//  PGQ_SingViewController.m
//  PGQLZKugouDemo
//
//  Created by ios on 16/7/25.
//  Copyright © 2016年 PL. All rights reserved.
//

#import "PGQ_SingViewController.h"
#import "BasicHeader.h"
@interface PGQ_SingViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *bodySrcollView;
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation PGQ_SingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:self.topScrollView.bounds];
        imgView.x = i * self.topScrollView.width;
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image%d",(int)i]];
        [self.topScrollView addSubview:imgView];
    }
    self.topScrollView.contentSize = CGSizeMake(4 * self.topScrollView.width, 0);
    self.topScrollView.showsVerticalScrollIndicator = NO;
    self.topScrollView.showsHorizontalScrollIndicator = NO;
    self.topScrollView.bounces = NO;
    
    NSLog(@"------%f",self.topScrollView.contentSize.width);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"sing page");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
