//
//  JiKeScrollViewVC.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/24.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "JiKeScrollViewVC.h"
#import "Cionfig.h"
#import "JiKeScrollView.h"

@interface JiKeScrollViewVC ()

//模拟数据
@property (nonatomic,strong) NSArray *tempImageLinkDataArray;
@property (nonatomic,strong) NSArray *tempImageDesDataArray;

@property (nonatomic,strong) JiKeScrollView *myJikeScrollView;

@end

@implementation JiKeScrollViewVC
{
    int dataShowIndex;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.alpha = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    
    LxDBAnyVar(LLScreenWidth);
    
    UIImageView *bkIconView = [[UIImageView alloc] initWithFrame:(CGRect){0,0,LLScreenWidth,LLScreenHeight}];
    bkIconView.image = [UIImage imageNamed:@"background.png"];
    [self.view addSubview:bkIconView];
    
    //滚动图
    
    _myJikeScrollView = ({
        JiKeScrollView *scrollView = [[JiKeScrollView alloc] initWithFrame:[self getScrollViewFrame]];
        scrollView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:scrollView];
        scrollView;
    });
    
    //换一换按钮
    UIButton *button = [[UIButton alloc] initWithFrame:[self getButtonFrame]];
    [button  setTitle:@"换一换" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont italicSystemFontOfSize:15];
    button.layer.cornerRadius = LLScreenWidth == 320 ? 15 : 20;
    button.layer.borderWidth = 1;
    [button addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    //初始化假数据
    _myJikeScrollView.myFirstShowImageLinkArray = @[
                                                    @[@"11",@"12"],
                                                    @[@"13",@"14"],
                                                    @[@"15",@"16"]
                                                    ];
    _myJikeScrollView.myFirstShowLabelDesArray = @[
                                                   @[@"左边初始描述文字1",@"左边初始描述文字2"],
                                                   @[@"中间初始描述文字3",@"中间初始描述文字4"],
                                                   @[@"右边初始描述文字5",@"右边初始描述文字6"]
                                                   ];
    
    
  

    
//    [NSTimer scheduledTimerWithTimeInterval:0.5f
//                                     target:self
//                                   selector:@selector(btnOnClick)
//                                   userInfo:nil
//                                    repeats:YES];
    
}

- (IBAction)btnOnClick {
    
    dataShowIndex = dataShowIndex >= self.tempImageLinkDataArray.count ? 0 : dataShowIndex;
    
    _myJikeScrollView.myNextShowImageLinkArray = self.tempImageLinkDataArray[dataShowIndex];
    _myJikeScrollView.myNextShowLabelDesArray = self.tempImageDesDataArray[dataShowIndex];
    
    dataShowIndex++;
    NSLog(@"- %d",dataShowIndex);
}


- (NSArray *)tempImageDesDataArray
{
    if (!_tempImageDesDataArray) {
        _tempImageDesDataArray = @[
                                   @[@"这些微博的评论更好",@"法国电影咨询",@"果壳精选"],
                                   @[@"被曝光刷量了",@"Vista看了天",@"FaceBook最新消息推送"],
                                   @[@"鲍勃·迪伦",@"《神探夏洛克》第四季消息",@"我的狂怒你你驾驭不住"],
                                   @[@"Pantone发现了新东西",@"国服新网游测试预告布了新的流行色",@"张碧池小姐分享了新表情"],
                                   @[@"每日新闻联播头条",@"明星大V秒删微博提醒",@"每日一首提神歌曲"],
                                   @[@"老司机带带我",@"\"人人都是产品经理\"精华文章",@"时令水果上市提醒"],
                                   ];
    }
    return _tempImageDesDataArray;
}


- (NSArray *)tempImageLinkDataArray
{
    if (!_tempImageLinkDataArray) {
        _tempImageLinkDataArray = @[
                                    @[@"1",@"2",@"3"],
                                    @[@"4",@"5",@"6"],
                                    @[@"7",@"8",@"9"],
                                    @[@"10",@"11",@"12"],
                                    @[@"13",@"14",@"15"],
                                    @[@"16",@"17",@"18"],
                                    ];
    }
    return _tempImageLinkDataArray;
}


- (CGRect)getScrollViewFrame{
    CGRect frame;
    if (LLScreenWidth == 320)
        frame = (CGRect){0,107,LLScreenWidth,151.298625};
    else if (LLScreenWidth == 375)
        frame = (CGRect){0,125,LLScreenWidth,169.630125};
    else
        frame = (CGRect){0,110,LLScreenWidth,182.628825};
    return frame;
}


- (CGRect)getButtonFrame{
    CGRect frame;
    if (LLScreenWidth == 320)
        frame = (CGRect){(LLScreenWidth-220)*0.5, _myJikeScrollView.bottom+10, 220, 30};
    else if (LLScreenWidth == 375)
        frame = (CGRect){(LLScreenWidth-220)*0.5, _myJikeScrollView.bottom+20, 220, 35};
    else
        frame = (CGRect){(LLScreenWidth-220)*0.5, _myJikeScrollView.bottom+5, 220, 35};
    return frame;
}

@end
