//
//  UIView+Extension.m
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import "UIView+Extension.h"

#define SCREEN_SCALE                    ([[UIScreen mainScreen] scale])
#define PIXEL_INTEGRAL(pointValue)      (round(pointValue * SCREEN_SCALE) / SCREEN_SCALE)

@implementation UIView (Extension)

// Setters
-(void)setX:(CGFloat)x{
    self.frame      = CGRectMake(PIXEL_INTEGRAL(x), self.y, self.width, self.height);
}

-(void)setY:(CGFloat)y{
    self.frame      = CGRectMake(self.x, PIXEL_INTEGRAL(y), self.width, self.height);
}

-(void)setWidth:(CGFloat)width{
    self.frame      = CGRectMake(self.x, self.y, PIXEL_INTEGRAL(width), self.height);
}

-(void)setHeight:(CGFloat)height{
    self.frame      = CGRectMake(self.x, self.y, self.width, PIXEL_INTEGRAL(height));
}

-(void)setOrigin:(CGPoint)origin{
    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    self.x          = right - self.width;
}

-(void)setBottom:(CGFloat)bottom {
    self.y          = bottom - self.height;
}

-(void)setLeft:(CGFloat)left{
    self.x          = left;
}

-(void)setTop:(CGFloat)top{
    self.y          = top;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center     = CGPointMake(PIXEL_INTEGRAL(centerX), self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    self.center     = CGPointMake(self.center.x, PIXEL_INTEGRAL(centerY));
}

- (void)onTap:(id)target action:(SEL)sel {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:sel];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:singleTap];
}

@end
