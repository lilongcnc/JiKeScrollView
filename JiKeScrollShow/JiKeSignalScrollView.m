//
//  JiKeScrollView.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/23.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "JiKeSignalScrollView.h"
#import "UIView+Frame.h"
#import "JiKeScrollImageView.h"
#import "JiKeScrollLabel.h"
#import "Cionfig.h"

@interface JiKeSignalScrollView ()

@property (nonatomic,strong) JiKeScrollImageView *myJiKeScrollImageView;
@property (nonatomic,strong) JiKeScrollLabel *myJiKeScrollLabel;

@property (nonatomic,strong) UIView *mySignleShowView;

//模拟数据
@property (nonatomic,strong) NSArray *tempDataArray;
@end


@implementation JiKeSignalScrollView{
    int dataShowIndex;
}

-(instancetype)initWithFrame:(CGRect)frame withScrollLabelSize:(CGSize)labelSize{
    
    if (self = [super initWithFrame:frame]) {
        //初始化控件
        [self initSubViewsWithLabelSize:labelSize];
    }
    return self;
}



- (void)initSubViewsWithLabelSize:(CGSize)LabelSize{
    
    //滚动图
    _myJiKeScrollImageView = ({
        JiKeScrollImageView *scrollImageView = [[JiKeScrollImageView alloc] initWithFrame:(CGRect){0,0,self.frame.size.width,self.frame.size.width}];
        [self addSubview:scrollImageView];
        scrollImageView;
    });
    
    
    //滚动文字
    _myJiKeScrollLabel = ({
        CGFloat scrollLabelY = self.frame.size.height - LabelSize.height*2 - LLTBMargin;
        JiKeScrollLabel *scrollLabel = [[JiKeScrollLabel alloc] initWithFrame:(CGRect){0,scrollLabelY,self.frame.size.width,LabelSize.height*2}];
        [self addSubview:scrollLabel];
        scrollLabel;
    });
}




//初始化数据
-(void)setMyFirstShowLabelDesArray:(NSArray *)myFirstShowLabelDesArray{
    _myJiKeScrollLabel.myFirstShowLabelDesArray = myFirstShowLabelDesArray;
}

-(void)setMyFirstShowImageLinkArray:(NSArray *)myFirstShowImageLinkArray{
    _myJiKeScrollImageView.myFirstShowImageLinkArray = myFirstShowImageLinkArray;
}



//执行下一次显示动画
-(void)setMyNextShowLabelDes:(NSString *)myNextShowLabelDes{
    _myJiKeScrollLabel.myNextShowLabelDes = myNextShowLabelDes;
}

-(void)setMyNextShowImageLink:(NSString *)myNextShowImageLink{
    _myJiKeScrollImageView.myNextShowImageLink = myNextShowImageLink;
}








@end
