//
//  FlowerView.m
//  FlyweightPatternDemo
//
//  Created by cs on 2019/4/7.
//  Copyright © 2019 cs. All rights reserved.
//

#import "FlowerView.h"

@implementation FlowerView

- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}

@end
