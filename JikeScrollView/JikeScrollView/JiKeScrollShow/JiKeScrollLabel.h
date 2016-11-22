//
//  JiKeScrollLabel.h
//  JikePictureShow
//
//  Created by 李龙 on 16/11/21.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiKeScrollLabel : UIView

//- (void)beiginScrollDown;

/**
 设置首次进入程序先显示的图片名称或者链接(自行扩展增加网络图片加载)
 ,不执行滚动
 */
@property (nonatomic,copy) NSString *myFirstShowLabelDes;


/**
 下一张要显示的图片名称或者链接
 */
@property (nonatomic,copy) NSString *myNextShowLabelDes;




@end
