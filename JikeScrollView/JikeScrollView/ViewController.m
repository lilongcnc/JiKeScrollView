//
//  ViewController.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/22.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "JiKeScrollImageView.h"
#import "JiKeScrollLabel.h"
#import "Cionfig.h"


#define LLScreenWidth            ([[UIScreen mainScreen] bounds].size.width)
#define LLScreenHeight           ([[UIScreen mainScreen] bounds].size.height)


@interface ViewController ()

@property (nonatomic,strong) JiKeScrollImageView *myScrollImageView;
@property (nonatomic,strong) JiKeScrollLabel *myJiKeScrollLabel;


@property (nonatomic,strong) UIView *mySignleShowView;

//模拟数据
@property (nonatomic,strong) NSArray *tempDataArray;
@end

@implementation ViewController{
    int dataShowIndex;
}

- (NSArray *)tempDataArray
{
    if (!_tempDataArray) {
        _tempDataArray = @[
                           @[@"1",@"这些微博的评论更好看"],
                           @[@"2",@"「看理想」系列视频更新提醒"],
                           @[@"3",@"我的狂怒你驾驭不住"],
                           @[@"4",@"又有公众号被曝光刷量了"],
                           @[@"5",@"This is a sunshine,what your name?"],
                           @[@"6",@"FaceBook最新消息推送"],
                           @[@"7",@"鲍勃·迪伦的音乐作品欣赏"],
                           @[@"8",@"《神探夏洛克》第四季消息"],
                           @[@"9",@"\"人人都是产品经理\"精华文章"],
                           @[@"10",@"每日新闻联播头条"],
                           @[@"11",@"Pantone发布了新的流行色"],
                           @[@"12",@"国服新网游测试预告"],
                           @[@"13",@"张碧池小姐分享了新表情"],
                           @[@"14",@"Vista看了天下有新的高清配图"],
                           @[@"15",@"明星大V秒删微博提醒"],
                           @[@"16",@"每日一首提神歌曲"],
                           @[@"17",@"果壳精选"],
                           @[@"18",@"时令水果上市提醒"]
                           ];
    }
    
    return _tempDataArray;
}





- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //    CGFloat topmargin = 10;
    //    CGFloat showViewHeight = 150;
    
    CGFloat TBMargin = 10;
    CGFloat margin = 10;
    CGFloat showImageHeight = 110;
    CGFloat showLabelHeight = 30;
    CGFloat showViewHeight = TBMargin*2 + margin + showImageHeight + showLabelHeight;
    
    //显示单组的View
    _mySignleShowView = ({
        UIView *showView = [[UIView alloc] initWithFrame:(CGRect){0,100,LLScreenWidth,showViewHeight}];
        showView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:showView];
        showView;
    });
    
    
    //滚动图
    _myScrollImageView = ({
        JiKeScrollImageView *scrollImageView = [JiKeScrollImageView new];
        scrollImageView.y = TBMargin;
        scrollImageView.x = 15;
        [_mySignleShowView addSubview:scrollImageView];
        scrollImageView;
    });
    
    
    //滚动文字
    _myJiKeScrollLabel = ({
        JiKeScrollLabel *scrollLabel = [JiKeScrollLabel new];
        scrollLabel.x = 15;
        scrollLabel.y = TBMargin + _myScrollImageView.width + margin;
        [_mySignleShowView addSubview:scrollLabel];
        scrollLabel;
    });
    
    
    //第一次请求到的数据
    _myScrollImageView.myFirstShowImageLink = @"1";
    _myJiKeScrollLabel.myFirstShowLabelDes = @"xx";
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f
                                     target:self
                                   selector:@selector(btnOnClick)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (IBAction)btnOnClick {
    
    NSArray *tempArr = [self getNextShowData];
    _myScrollImageView.myWouldShowImageLink = tempArr[0];
    _myJiKeScrollLabel.myNextShowLabelDes = tempArr[1];
    
    dataShowIndex == self.tempDataArray.count ? 0 : dataShowIndex++;
}



- (NSArray *)getNextShowData{
    NSArray *tempArr = self.tempDataArray[dataShowIndex];
    return tempArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
