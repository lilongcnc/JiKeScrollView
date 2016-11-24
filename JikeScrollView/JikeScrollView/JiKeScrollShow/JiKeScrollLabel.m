//
//  JiKeScrollLabel.m
//  JikePictureShow
//
//  Created by 李龙 on 16/11/21.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "JiKeScrollLabel.h"
#import "UIView+Frame.h"
#import "Cionfig.h"

@interface JiKeScrollLabel ()


@property (nonatomic,strong) UILabel *myLabel0;
@property (nonatomic,strong) UILabel *myLabel1;
@property (nonatomic,strong) NSArray *myLabelArray;

@end


@implementation JiKeScrollLabel
{
    int _scrollIndex;
    BOOL isRunning;
    
    CGFloat _originalTopY;
    CGFloat _originalCenterY;
    CGFloat _originalDownY;
    
    NSString *currentShowDes;
    
}



- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        //初始化控件
        [self initSubViews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化控件
        [self initSubViews];
    }
    return self;
}


- (NSArray *)myLabelArray
{
    if (!_myLabelArray) {
        
        UILabel *label0 = [[UILabel alloc] init];
        UILabel *label1 = [[UILabel alloc] init];
        _myLabelArray = [NSArray arrayWithObjects:label0,label1, nil];
    }
    
    return _myLabelArray;
}




- (void)initSubViews{

    CGFloat labelW = self.frame.size.width;
    CGFloat labelH = self.frame.size.height;
    
    CGFloat topMargin = 0;
    
    _originalTopY = topMargin-labelH;
    _originalCenterY = topMargin;
    _originalDownY = topMargin+labelH;
    
    UIFont *labelFont = LLLabelFont;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, labelW, labelH)];
    backView.clipsToBounds = YES;
    [self addSubview:backView];
    

    
    _myLabel0 = ({
        UILabel *label = self.myLabelArray[0];
        label.frame = (CGRect){0,_originalCenterY,labelW,labelH};
        label.numberOfLines = 0;
        label.font = labelFont;
//        label.backgroundColor = [UIColor greenColor];
        [backView addSubview:label];
        label;
    });
    
    _myLabel1 = ({
        UILabel *label = self.myLabelArray[1];
        label.frame = (CGRect){0,_originalTopY,labelW,labelH};
        label.numberOfLines = 0;
        label.font = labelFont;
//        label.backgroundColor = [UIColor yellowColor];
        [backView addSubview:label];
        label;
    });
    
    _scrollIndex = 0;
    
}


- (void)beiginScrollDown{
    
    _scrollIndex++;
    [self runAnimation];
}

- (void)runAnimation{
    
    _myLabel0.alpha = 1;
    _myLabel1.alpha = 1;

    void (^changeBlock)() = ^(){
        
        NSLog(@"%@",currentShowDes);
        
        isRunning = YES;
        if ([self isInTwoWholeLine:currentShowDes]) {
            NSLog(@"--------- 开始0");
            //第一个动画
            if (_scrollIndex == 1) {
                _myLabel1.y = _originalCenterY;
                
                _myLabel0.y = _originalDownY;
                _myLabel0.alpha = 0.3;
                
            }else if(_scrollIndex == 2){
                
                _myLabel0.y = _originalCenterY;
                
                _myLabel1.y = _originalDownY;
                _myLabel1.alpha = 0.3;
                
                _scrollIndex = 0; //标记归0
            }
            
        }else{
            //叠影动画逻辑
            //当前正在显示的label的动画执行时间比即将显示的label的动画执行时间延迟一些执行,产生叠影效果
            NSLog(@"动画2");

            if (_scrollIndex == 1) {
                
                _myLabel1.y = _originalCenterY;
                
                void (^overlapChangeBlock)() = ^(){
                    _myLabel0.alpha = 0.2;
                    _myLabel0.y = _originalDownY;
                };
                
                
                [self doAnimationWithDuration:0.4f delay:0.2f change:overlapChangeBlock completion:nil];
                
            }else if(_scrollIndex == 2){

                _myLabel0.y = _originalCenterY;
                
                void (^overlapChangeBlock)() = ^(){
                    _myLabel1.alpha = 0.2;
                    _myLabel1.y = _originalDownY;
                };
                
                [self doAnimationWithDuration:0.4f delay:0.2f change:overlapChangeBlock completion:nil];
                
                _scrollIndex = 0; //标记归0
            }            
        }

    };
    
    
    
    void (^completionBlock)(BOOL) =  ^(BOOL finished){
        if(finished){
            
                //第一个动画
            if (_scrollIndex == 1) {
                
                _myLabel0.alpha = 0;
                _myLabel0.y = _originalTopY;
                _myLabel0.alpha = 1;
                _myLabel0.text = [self getRealShowStr:_myNextShowLabelDes];
                
                currentShowDes = _myLabel1.text;
            }else if(_scrollIndex == 0){
                
                _myLabel1.alpha = 0;
                _myLabel1.y = _originalTopY;
                _myLabel1.alpha = 1;
                _myLabel1.text = [self getRealShowStr:_myNextShowLabelDes];
                
                currentShowDes = _myLabel0.text;
            }
            NSLog(@"--------- 结束0");
            
            isRunning = NO;
        }
        
        
    };

    
    [self doAnimationWithDuration:0.6f delay:0.1f change:changeBlock completion:completionBlock];
    
}


- (void)doAnimationWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay change:(void(^)())changeBK completion:(void(^)(BOOL finished))competionBK{
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:changeBK completion:competionBK];
}


#pragma mark ================ 处理数据 ================
-(void)setMyFirstShowLabelDesArray:(NSArray *)myFirstShowLabelDesArray{
    if(myFirstShowLabelDesArray == nil || myFirstShowLabelDesArray.count < 2)
        ULog(@"请设置两张初始化图片的描述");
    _myFirstShowLabelDesArray = myFirstShowLabelDesArray;
    currentShowDes = myFirstShowLabelDesArray[0];
    _myLabel0.text = [self getRealShowStr:myFirstShowLabelDesArray[0]];
    _myLabel1.text = [self getRealShowStr:myFirstShowLabelDesArray[1]];
    
}


-(void)setMyNextShowLabelDes:(NSString *)myNextShowLabelDes{
    
    //保证动画当前顺序执行
    if (isRunning){
        NSLog(@"---------------------------  Label动画ing ------------------------");
        return;
    }

    //数据处理
    if(_myFirstShowLabelDesArray == nil || _myFirstShowLabelDesArray.count < 2)
        ULog(@"还是设置完整图片描述吧");
    
    _myNextShowLabelDes = myNextShowLabelDes;
    
    [self beiginScrollDown];
}


- (BOOL)isInTwoWholeLine:(NSString *)str{
    CGSize labelSize = [self getSizeWithStrig:str font:LLLabelFont maxSize:(CGSize){MAXFLOAT,MAXFLOAT}];
    return labelSize.width>self.width;
}

- (NSString *)getRealShowStr:(NSString *)str{
    CGSize labelSize = [self getSizeWithStrig:str font:LLLabelFont maxSize:(CGSize){MAXFLOAT,MAXFLOAT}];

    if (labelSize.width <= self.frame.size.width) {
        str = [str stringByAppendingString:@"\n"];
    }
    
    return str;
}



- (CGSize)getSizeWithStrig:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
