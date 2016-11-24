//
//  JiKeScrollImageViewVC.m
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/24.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "JiKeScrollImageViewVC.h"
#import "JiKeScrollImageView.h"
#import "Cionfig.h"


@interface JiKeScrollImageViewVC ()

@property (nonatomic,strong) JiKeScrollImageView *myJiKeScrollImageView;
@property (nonatomic,strong) NSArray *tempDataArray;

@end

@implementation JiKeScrollImageViewVC
{
    int dataShowIndex;
    
}

- (NSArray *)tempDataArray
{
    if (!_tempDataArray) {
        _tempDataArray = @[
                           @"1",@"2",@"3",
                           @"4",@"5",@"6",
                           @"7",@"8",@"9",
                           @"10",@"11",@"12",
                           @"13",@"14",@"15",
                           @"16",@"17",@"18"
                           ];
    }
    return _tempDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.alpha = 1;

    
    //滚动图
    _myJiKeScrollImageView = ({
        JiKeScrollImageView *scrollImageView = [[JiKeScrollImageView alloc] initWithFrame:(CGRect){(LLScreenWidth-100)*0.5,100,100,100}];
        LxDBAnyVar(scrollImageView);
        [self.view addSubview:scrollImageView];
        scrollImageView;
    });
    
    _myJiKeScrollImageView.myFirstShowImageLinkArray = @[@"1",@"2"];

}




- (IBAction)btnOnClick:(id)sender{
    dataShowIndex = dataShowIndex >= self.tempDataArray.count ? 0 : dataShowIndex;
    _myJiKeScrollImageView.myNextShowImageLink = self.tempDataArray[dataShowIndex];
    dataShowIndex++;
}


-(void)setMyFirstShowImageLinkArray:(NSArray *)myFirstShowImageLinkArray{
    _myJiKeScrollImageView.myFirstShowImageLinkArray = myFirstShowImageLinkArray;
    
}


-(void)setMyNextShowImageLink:(NSString *)myNextShowImageLink{
    _myJiKeScrollImageView.myNextShowImageLink = myNextShowImageLink;
}






@end
