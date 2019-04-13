//
//  NewsModel.h
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject

/** id */
@property(nonatomic, copy)NSString *newsId;
/** icon */
@property(nonatomic, copy)NSString *icon;
/** title */
@property(nonatomic, copy)NSString *title;
/** subTitle */
@property(nonatomic, copy)NSString *subTitle;
/** content */
@property(nonatomic, copy)NSString *content;
/** if attention */
@property(nonatomic, assign, getter=isAttention)BOOL attention;
/** imgList */
@property(nonatomic, copy)NSArray *imgs;
/** share number */
@property(nonatomic, assign)NSUInteger shareNum;
/** discuss num */
@property(nonatomic, assign)NSUInteger discussNum;
/** like */
@property(nonatomic, assign)NSUInteger likeNum;
/** if like */
@property(nonatomic, assign,getter=isLike)BOOL like;

/// 添加关注
- (void)addAttention:(void(^)(NSDictionary *json))callback;

/// 添加点赞
- (void)addLike:(void(^)(NSDictionary *json))callback;

@end

NS_ASSUME_NONNULL_END
