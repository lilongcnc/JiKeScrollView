//
//  Cionfig.h
//  JikePictureShow
//
//  Created by 李龙 on 16/11/22.
//  Copyright © 2016年 李龙. All rights reserved.
//

#ifndef Cionfig_h
#define Cionfig_h


//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif




#define LLScreenWidth            ([[UIScreen mainScreen] bounds].size.width)
#define LLScreenHeight           ([[UIScreen mainScreen] bounds].size.height)

#define LLLabelFont [UIFont systemFontOfSize:12]
#define LLTBMargin 13 //signalScrollView顶部和底部间距
#define LLLRMargin 15 //signalScrollView左右边界间距
#define LLhorizontalMargin 10  //signalScrollView水平间距
#define LLverticalMargin 15  //signalScrollView竖直间



#import "LxDBAnything.h"

#endif /* Cionfig_h */
