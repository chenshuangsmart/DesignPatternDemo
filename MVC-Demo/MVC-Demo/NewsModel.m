//
//  NewsModel.m
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import "NewsModel.h"

NSString *API_GetGaoShiList = @"http://rap2api.taobao.org/app/mock/163155/gaoshilist"; // 告示列表
NSString *API_GetUserInfo = @"http://rap2api.taobao.org/app/mock/163155/userinfo";   // 用户信息

@implementation NewsModel

/// 添加关注
- (void)addAttention:(void(^)(NSDictionary *json))callback {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:API_GetUserInfo] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (callback) {
                callback(nil);
            }
        });
    }];
    [task resume];
}

/// 添加点赞
- (void)addLike:(void(^)(NSDictionary *json))callback {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:API_GetGaoShiList] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error == nil) {
                    self.like = !self.like;
                    if (self.like) {
                        self.likeNum += 1;
                    } else {
                        self.likeNum -= 1;
                    }
                }
                if (callback) {
                    callback(nil);
                }
            });
        });
    }];
    [task resume];
}

@end
