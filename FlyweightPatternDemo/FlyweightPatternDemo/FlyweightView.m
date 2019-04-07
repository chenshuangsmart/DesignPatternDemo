//
//  FlyweightView.m
//  FlyweightPatternDemo
//
//  Created by cs on 2019/4/7.
//  Copyright © 2019 cs. All rights reserved.
//

#import "FlyweightView.h"
#import "FlowerView.h"

@implementation FlyweightView

- (void)drawRect:(CGRect)rect {
    for (NSDictionary *dic in self.flowerList) {
        NSValue *key = (NSValue *)[dic allKeys][0];
        FlowerView *flowerView = (FlowerView *)[dic allValues][0];
        CGRect area = [key CGRectValue];
        [flowerView drawRect:area];
    }
}

@end
