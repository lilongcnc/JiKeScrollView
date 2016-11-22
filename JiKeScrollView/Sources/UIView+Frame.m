//
//  UIView+Frame.m
//  
//
//  Created by ws ou on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIView+Frame.h"

TT_FIX_CATEGORY_BUG(UIView_Frame)
@implementation UIView (Frame)


-(CGFloat)x
{
	return self.frame.origin.x;
}
-(void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

-(CGFloat)y
{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

-(CGFloat)width
{
	return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

-(CGFloat)height
{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

-(CGFloat) left
{
	return self.x;
}
-(CGFloat) top
{
	return self.y;
}
-(CGFloat) right
{
	return self.x + self.width;
}
- (void)setRight:(CGFloat)right
{
    self.x = right-self.width;
}
-(CGFloat) bottom
{
	return self.y + self.height;
}
-(void)setBottom:(CGFloat)bottom
{
    self.y = bottom - self.height;
}
-(void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}
-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}
-(CGFloat)centerY
{
    return self.center.y;
}

-(void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}
-(CGSize)size
{
    return self.frame.size;
}
-(CGPoint)origin
{
    return self.frame.origin;
}
-(void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}

@end
