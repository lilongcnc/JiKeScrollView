//
//  LLTool.h
//  JiKeScrollView
//
//  Created by 李龙 on 16/11/24.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LLTool : NSObject

+ (CGSize)getSizeWithStrig:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

@end
