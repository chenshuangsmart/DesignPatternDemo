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

/** icon */
@property(nonatomic, copy)NSString *icon;
/** title */
@property(nonatomic, copy)NSString *title;
/** subTitle */
@property(nonatomic, copy)NSString *subTitle;
/** content */
@property(nonatomic, copy)NSString *content;
/** imgList */
@property(nonatomic, copy)NSArray *imgs;
/** share number */
@property(nonatomic, assign)NSUInteger shareNum;
/** discuss num */
@property(nonatomic, assign)NSUInteger discussNum;
/** like */
@property(nonatomic, assign)NSUInteger likeNum;

@end

NS_ASSUME_NONNULL_END
