//
//  NewsActionView.m
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import "NewsActionView.h"
#import "UIView+Extension.h"

@interface NewsActionView()
/** img */
@property(nonatomic, weak)UIImageView *imgView;
/** title */
@property(nonatomic, weak)UILabel *titleLbe;
@end

@implementation NewsActionView {
    NSString *_imgName;
    NSString *_title;
}

- (instancetype)initWithFrame:(CGRect)frame imgName:(NSString *)imgName title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imgName]];
    [self addSubview:imgView];
    self.imgView = imgView;
    
    UILabel *lbe = [[UILabel alloc] init];
    lbe.font = [UIFont systemFontOfSize:14];
    lbe.textColor = [UIColor blackColor];
    lbe.text = _title;
    [lbe sizeToFit];
    [self addSubview:lbe];
    self.titleLbe = lbe;
    
    imgView.centerY = self.height * 0.5;
    imgView.x = (self.width - imgView.width - 10 - lbe.width) * 0.5;
    
    lbe.x = imgView.right + 10;
    lbe.centerY = self.height * 0.5;
}

- (void)updateTitle:(NSString *)tilte {
    _title = tilte;
    self.titleLbe.text = tilte;
    [self.titleLbe sizeToFit];
    
    self.imgView.x = (self.width - self.imgView.width - 10 - self.titleLbe.width) * 0.5;
    self.titleLbe.x = self.imgView.right + 10;
}

@end
