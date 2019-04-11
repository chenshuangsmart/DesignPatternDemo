//
//  NewsActionView.h
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsActionView : UIView

- (instancetype)initWithFrame:(CGRect)frame imgName:(NSString *)imgName title:(NSString *)title;

- (void)updateTitle:(NSString *)tilte;

@end

NS_ASSUME_NONNULL_END
