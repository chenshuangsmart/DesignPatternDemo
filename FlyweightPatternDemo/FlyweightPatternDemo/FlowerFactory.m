//
//  FlowerFactory.m
//  FlyweightPatternDemo
//
//  Created by cs on 2019/4/7.
//  Copyright © 2019 cs. All rights reserved.
//

#import "FlowerFactory.h"
#import "FlowerView.h"

@interface FlowerFactory()
/** flowerPool */
@property(nonatomic, strong)NSMutableDictionary *flowerPool;
@end

@implementation FlowerFactory

- (UIImageView *)flowerViewWithType:(FlowerType)type {
    UIImageView *flowerView = [self.flowerPool objectForKey:[NSNumber numberWithInt:type]];
    
    if (flowerView == nil) {
        UIImage *flowerImage;
        
        switch (type) {
            case FlowerPeachBlossomType:
                flowerImage = [UIImage imageNamed:@"peachBloss"];
                break;
            case FlowerClubsType:
                flowerImage = [UIImage imageNamed:@"clubs"];
                break;
            case FlowerPenoyType:
                flowerImage = [UIImage imageNamed:@"penoy"];
                break;
            case FlowerCloveType:
                flowerImage = [UIImage imageNamed:@"clove"];
                break;
            case FlowerCuckooType:
                flowerImage = [UIImage imageNamed:@"cuckoo"];
                break;
            case FloweJasmineType:
                flowerImage = [UIImage imageNamed:@"jasmine"];
                break;
            default:
                break;
        }
        
        flowerView = [[FlowerView alloc] initWithImage:flowerImage];
        [self.flowerPool setObject:flowerView forKey:[NSNumber numberWithInt:type]];
    }
    
    return flowerView;
}

#pragma mark - lazy

- (NSMutableDictionary *)flowerPool {
    if (_flowerPool == nil) {
        _flowerPool = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerTypes];
    }
    return _flowerPool;
}

@end
