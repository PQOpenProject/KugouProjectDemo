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
    self.topScrollView.contentSize = CGSizeMake(4 * self.topScrollView.width, 1500);
    self.topScrollView.showsVerticalScrollIndicator = NO;
    self.topScrollView.showsHorizontalScrollIndicator = NO;
    self.topScrollView.bounces = NO;
    
    NSLog(@"------%f",self.topScrollView.contentSize.width);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch * touch = [touches anyObject];
//    CGPoint current = [touch locationInView:self.topScrollView];
//    
//}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    // 获取一个UITouch
    UITouch *touch = [touches anyObject];
    // 获取当前的位置
    CGPoint current = [touch locationInView:self.topScrollView];
    CGFloat y = 280;
    if (current.y >= y+ 10) {
        //在地图上
        NSLog(@"滚动地图");
        return YES;
    } else {
        return NO;
    }
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
