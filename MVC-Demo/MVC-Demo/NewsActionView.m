//
//  NewsActionView.m
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import "NewsActionView.h"
#import "UIView+Extension.h"
#import "Masonry/Masonry.h"

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
        _imgName = imgName;
        _title = title;
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
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.trailing.equalTo(self.mas_centerX).offset(-2);
    }];
    
    [lbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.leading.equalTo(self.mas_centerX).offset(+2);
    }];
}

- (void)updateTitle:(NSString *)tilte {
    _title = tilte;
    self.titleLbe.text = tilte;
    [self.titleLbe sizeToFit];
    
    [self.titleLbe mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.leading.equalTo(self.mas_centerX).offset(+2);
    }];
}

@end
