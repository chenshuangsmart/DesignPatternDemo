//
//  FlowerFactory.h
//  FlyweightPatternDemo
//
//  Created by cs on 2019/4/7.
//  Copyright © 2019 cs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kTotalNumberOfFlowerTypes 6

// 花种类
typedef NS_ENUM (NSUInteger,FlowerType) {
    FlowerPeachBlossomType = 0, // 桃花
    FlowerClubsType = 1, // 梅花
    FlowerPenoyType = 2, // 牡丹
    FlowerCloveType = 3, // 丁香
    FlowerCuckooType = 4, // 杜鹃
    FloweJasmineType = 5, // 茉莉花
};

NS_ASSUME_NONNULL_BEGIN

/**
 花建造者
 */
@interface FlowerFactory : NSObject

/// 生成花视图
- (UIImageView *)flowerViewWithType:(FlowerType)type;

@end

NS_ASSUME_NONNULL_END
