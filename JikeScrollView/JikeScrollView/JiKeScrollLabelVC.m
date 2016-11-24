//
//  JiKeScrollLabelVC.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/24.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "JiKeScrollLabelVC.h"
#import "JiKeScrollLabel.h"
#import "Cionfig.h"

@interface JiKeScrollLabelVC ()


@property (nonatomic,strong) JiKeScrollLabel *myJiKeScrollLabel;
@property (nonatomic,strong) NSArray *tempDataArray;
@end

@implementation JiKeScrollLabelVC
{
    int dataShowIndex;
    
}


- (NSArray *)tempDataArray
{
    if (!_tempDataArray) {
        _tempDataArray = @[
                           @"这些微博的评论更好",@"法国电影咨询",@"果壳精选",
                           @"被曝光刷量了",@"Vista看了天",@"FaceBook最新消息推送",
                           @"鲍勃·迪伦",@"《神探夏洛克》第四季消息",@"我的狂怒你你驾驭不住",
                           @"Pantone发现了新东西",@"国服新网游测试预告布了新的流行色",@"张碧池小姐分享了新表情",
                           @"每日新闻联播头条",@"明星大V秒删微博提醒",@"每日一首提神歌曲",
                           @"老司机带带我",@"\"人人都是产品经理\"精华文章",@"时令水果上市提醒"
                           ];
    }
    return _tempDataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.alpha = 1;

    CGSize labelSize = [LLTool getSizeWithStrig:@"测试" font:LLLabelFont maxSize:(CGSize){100,MAXFLOAT}];
    
    //滚动文字
    _myJiKeScrollLabel = ({
        CGFloat scrollLabelY = 100;
        JiKeScrollLabel *scrollLabel = [[JiKeScrollLabel alloc] initWithFrame:(CGRect){(LLScreenWidth-100)*0.5,scrollLabelY,100,labelSize.height*2}];
        scrollLabel.layer.borderWidth = 1;
        [self.view addSubview:scrollLabel];
        scrollLabel;
    });
    

    _myJiKeScrollLabel.myFirstShowLabelDesArray =  @[@"首测数据一",@"首测数据二"];
}




- (IBAction)btnOnClick:(id)sender{
    
    dataShowIndex = dataShowIndex >= self.tempDataArray.count ? 0 : dataShowIndex;
    _myJiKeScrollLabel.myNextShowLabelDes = self.tempDataArray[dataShowIndex];
    dataShowIndex++;
}



//初始化数据
-(void)setMyFirstShowLabelDesArray:(NSArray *)myFirstShowLabelDesArray{
    _myJiKeScrollLabel.myFirstShowLabelDesArray = myFirstShowLabelDesArray;
}

//执行下一次显示动画
-(void)setMyNextShowLabelDes:(NSString *)myNextShowLabelDes{
    _myJiKeScrollLabel.myNextShowLabelDes = myNextShowLabelDes;
}







@end
