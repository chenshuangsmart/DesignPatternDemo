//
//  NewsCell.h
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@class NewsModel;

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : UITableViewCell

/** model */
@property(nonatomic, strong)NewsModel *model;

@end

NS_ASSUME_NONNULL_END
