//
//  ViewController.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/22.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "Cionfig.h"
#import "JiKeScrollView.h"




@interface ViewController ()

//@property (nonatomic,strong) JiKeScrollImageView *myScrollImageView;
//@property (nonatomic,strong) JiKeScrollLabel *myJiKeScrollLabel;
//
//
//@property (nonatomic,strong) UIView *mySignleShowView;
//
////模拟数据
//@property (nonatomic,strong) NSArray *tempDataArray;
//模拟数据
@property (nonatomic,strong) NSArray *tempImageLinkDataArray;
@property (nonatomic,strong) NSArray *tempImageDesDataArray;

@property (nonatomic,strong) JiKeScrollView *myJikeScrollView;

@end

@implementation ViewController
{
    int dataShowIndex;

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
                           @[@"这些微博的评论更好",@"\"人人都是产品经理\"精华文章",@"时令水果上市提醒"],
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





- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //滚动图
    _myJikeScrollView = ({
        JiKeScrollView *scrollView = [[JiKeScrollView alloc] initWithFrame:(CGRect){0,100,LLScreenWidth,151.298625}];
//        scrollView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:scrollView];
        scrollView;
    });
    
    _myJikeScrollView.myFirstShowImageLinkArray = @[@"0",@"1",@"3"];
    _myJikeScrollView.myFirstShowLabelDesArray = @[@"首次传入的描述文字1",@"首次传入的描述文字2",@"首次传入的描述文字3"];
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f
                                     target:self
                                   selector:@selector(btnOnClick)
                                   userInfo:nil
                                    repeats:YES];
    
}




- (IBAction)btnOnClick {

    dataShowIndex = dataShowIndex >= self.tempImageLinkDataArray.count ? 0 : dataShowIndex;

    _myJikeScrollView.myNextShowImageLinkArray = self.tempImageLinkDataArray[dataShowIndex];
    _myJikeScrollView.myNextShowLabelDesArray = self.tempImageDesDataArray[dataShowIndex];
    
    dataShowIndex++;
    NSLog(@"- %d",dataShowIndex);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
