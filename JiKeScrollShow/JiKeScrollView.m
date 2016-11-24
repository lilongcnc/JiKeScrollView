//
//  JiKeScrollView.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/23.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "JiKeScrollView.h"
#import "JiKeSignalScrollView.h"
#import "Cionfig.h"

@interface JiKeScrollView ()

@property (nonatomic,strong) JiKeSignalScrollView *myJikeSignalScrollView;

@property (nonatomic,strong) NSMutableArray *myShowViewArray;

@end

@implementation JiKeScrollView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        //初始化控件
        [self initSubViews];
    }
    return self;
}

//不要xxx.frame = GRectmake()这样设置frame
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化控件
        [self initSubViews];
    }
    return self;
}



- (void)initSubViews{
//    CGFloat TBMargin = 13; //signalScrollView顶部和底部间距
//    CGFloat LRMargin = 15; //signalScrollView左右边界间距
//    CGFloat horizontalMargin = 10; //signalScrollView水平间距
//    CGFloat verticalMargin = LRMargin; //signalScrollView竖直间距
    
    _myShowViewArray = [NSMutableArray arrayWithCapacity:3];

    LxDBAnyVar(self.frame);
    LxDBAnyVar(LLScreenWidth);
    LxDBAnyVar(LLScreenHeight);
    
    CGFloat singalScrollViewWidth = (LLScreenWidth - LLLRMargin*2 - LLverticalMargin*2)*0.3333;
    CGSize labelSize = [LLTool getSizeWithStrig:@"测试" font:LLLabelFont maxSize:(CGSize){singalScrollViewWidth,MAXFLOAT}];
    CGFloat singalScrollViewHeight = LLTBMargin*2 + LLhorizontalMargin + singalScrollViewWidth + labelSize.height*2;
    
    LxDBAnyVar(labelSize);
    LxDBAnyVar(singalScrollViewWidth);
    LxDBAnyVar(singalScrollViewHeight);

    for (int i = 0; i < 3; i++) {
        JiKeSignalScrollView *signalScrollView = [[JiKeSignalScrollView alloc] initWithFrame:(CGRect){LLLRMargin+(singalScrollViewWidth+LLverticalMargin)*i,0,singalScrollViewWidth,singalScrollViewHeight} withScrollLabelSize:labelSize];
        [self addSubview:signalScrollView];
//        signalScrollView.backgroundColor = [UIColor orangeColor];
        [_myShowViewArray addObject:signalScrollView];
    }
    
}




//处理首次传入的数据
-(void)setMyFirstShowLabelDesArray:(NSArray *)myFirstShowLabelDesArray{
    if(myFirstShowLabelDesArray.count <3)
        ULog(@"请传入三个图片描述");
    
    [self setFisrtJikeScrollLabelData:myFirstShowLabelDesArray];
}

-(void)setMyFirstShowImageLinkArray:(NSArray *)myFirstShowImageLinkArray{
    if(myFirstShowImageLinkArray.count <3)
        ULog(@"请传入三张图片的链接");
    
    [self setFisrtJikeScrollImageData:myFirstShowImageLinkArray];
}



//执行下次数据动画
-(void)setMyNextShowLabelDesArray:(NSArray *)myNextShowLabelDesArray{
    if(myNextShowLabelDesArray.count <3)
        ULog(@"请传入下一个三个图片描述");
    
    [self runJikeScrollLabelView:myNextShowLabelDesArray];
}


-(void)setMyNextShowImageLinkArray:(NSArray *)myNextShowImageLinkArray{
    if(myNextShowImageLinkArray.count <3)
        ULog(@"请传入下一个三张图片的链接");
    
    [self runJikeScrollImageView:myNextShowImageLinkArray];
}



//初始化数据
- (void)setFisrtJikeScrollImageData:(NSArray *)data{
    LxDBAnyVar(data);
    for (int i = 0; i < data.count; i++) {
        JiKeSignalScrollView *signView = _myShowViewArray[i];
        signView.myFirstShowImageLinkArray = data[i];
        
    }
}
- (void)setFisrtJikeScrollLabelData:(NSArray *)data{
    for (int i = 0; i < data.count; i++) {
        JiKeSignalScrollView *signView = _myShowViewArray[i];
        signView.myFirstShowLabelDesArray = data[i];
    }
}

//执行动画
- (void)runJikeScrollImageView:(NSArray *)data{
    for (int i = 0; i < data.count; i++) {
        
        void(^tempDelayRunBlock)() = ^(){
            JiKeSignalScrollView *signView = _myShowViewArray[i];
            signView.myNextShowImageLink = data[i];
        };
        [self delayRun:tempDelayRunBlock index:i];
    }
}

- (void)runJikeScrollLabelView:(NSArray *)data{
    for (int i = 0; i < data.count; i++) {
        void(^tempDelayRunBlock)() = ^(){
            JiKeSignalScrollView *signView = _myShowViewArray[i];
            signView.myNextShowLabelDes = data[i];
        };
        
        [self delayRun:tempDelayRunBlock index:i];
    }
}

//延迟执行代码
- (void)delayRun:(void (^)())delayRunBlock index:(int)index{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1*index * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (delayRunBlock)
            delayRunBlock();
    });
}

@end
