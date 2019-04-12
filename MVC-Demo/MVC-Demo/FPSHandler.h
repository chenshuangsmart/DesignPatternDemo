//
//  FPSHandler.h
//  MVC-Demo
//
//  Created by chenshuang on 2019/4/12.
//  Copyright © 2019年 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^fpsCallback)(float fps);

/// FPS监控回调
@interface FPSHandler : NSObject

+ (instancetype)shareInstance;

/// fps回调 1秒回调一次
- (void)startMonitor:(fpsCallback)callback;

@end

NS_ASSUME_NONNULL_END
