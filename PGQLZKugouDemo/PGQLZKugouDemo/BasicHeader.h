//
//  BasicHeader.h
//  KugouDemo
//
//  Created by ios on 16/7/21.
//  Copyright © 2016年 LZ. All rights reserved.
//

#ifndef BasicHeader_h
#define BasicHeader_h

//viwecontroller
#import "RootViewController.h"
#import "UIControl+PQControlExtension.h"
#import "UIImage+pgqImageExtension.h"
#import "IntroduceViewController.h"
//Listen
#import "ListenViewController.h"
//唱
#import "SingViewController.h"
//kan
#import "WatchViewController.h"

//navigationController
#import "PLNavigationViewController.h"

//category
#import "UIView+pgqViewExtension.h"
#import "UIAlertController+PQ_alertView.h"

//third party
#import "Masonry.h"
#import "ReactiveCocoa.h"

//定义一个宏 输入 名字和类别 得到路径
#define PATH_FORBUNDLE(name,type) [[NSBundle mainBundle] pathForResource:name ofType:type]
//加载一个nib
#define PQTH_NIBFORBUNDLE(name,owner) [[NSBundle mainBundle]loadNibNamed:name owner:owner options:nil]


//随机颜色
#define RANDOM_COLOR [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1 ]
//屏幕宽高
#define PL_SRCEEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define PL_SRCEEN_HEIGHT [UIScreen mainScreen].bounds.size.height


//接口
//酷狗搜歌接口
#define KGSEAECHURL @"http://mobilecdn.kugou.com/api/v3/search/song?format=jsonp"
#define KG_SEARCH(keyword,pageindex,pagesize) [NSString stringWithFormat:@"%@&keyword=%@&page=%@&pagesize=%@&showtype=1",KGSEAECHURL,keyword,pageindex,pagesize]

#endif /* BasicHeader_h */
