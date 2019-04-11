//
//  NewsCell.m
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import "NewsCell.h"
#import "UIView+Extension.h"
#import "NewsModel.h"
#import "NewsActionView.h"
#import "UIImageView+WebCache.h"
#import "Masonry/Masonry.h"

@interface NewsCell()
/** icon */
@property(nonatomic, strong)UIImageView *iconImgView;
/** title */
@property(nonatomic, strong)UILabel *titleLbe;
/** subTitle */
@property(nonatomic, strong)UILabel *subTitleLbe;
/** attention */
@property(nonatomic, strong)UILabel *attentionLbe;
/** delete */
@property(nonatomic, strong)UIImageView *deleteImgView;
/** content */
@property(nonatomic, strong)UILabel *contentLbe;
/** img view */
@property(nonatomic, strong)UIView *imgListView;
/** share */
@property(nonatomic, strong)NewsActionView *shareActionView;
/** discuss */
@property(nonatomic, strong)NewsActionView *discussActionView;
/** like */
@property(nonatomic, strong)NewsActionView *likeActionView;
/** divide line */
@property(nonatomic, strong)UIView *divideLineView;
@end

@implementation NewsCell

#define kImgViewWH (kScreenWidth - 20 - 15) / 4.0

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self drawUI];
    }
    return self;
}

#pragma mark - drawUI

- (void)drawUI {
    self.contentView.width = kScreenWidth;
    
    [self.contentView addSubview:self.iconImgView];
    [self.contentView addSubview:self.titleLbe];
    [self.contentView addSubview:self.subTitleLbe];
    [self.contentView addSubview:self.deleteImgView];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.leading.equalTo(self.contentView.mas_leading).offset(10);
    }];

    [self.titleLbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.iconImgView.mas_trailing).offset(10);
        make.bottom.equalTo(self.iconImgView.mas_centerY).offset(-2);
    }];
    
    [self.subTitleLbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLbe.mas_leading);
        make.top.equalTo(self.iconImgView.mas_centerY).offset(2);
    }];
    
    [self.deleteImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-10);
        make.centerY.equalTo(self.iconImgView.mas_centerY);
    }];
    
    self.attentionLbe.right = self.deleteImgView.x - 20;
    self.attentionLbe.centerY = self.iconImgView.centerY;
    [self.contentView addSubview:self.attentionLbe];
    
    self.contentLbe.y = self.iconImgView.bottom + 10;
    self.contentLbe.x = 10;
    [self.contentView addSubview:self.contentLbe];
    
    self.imgListView.y = self.contentLbe.bottom + 10;
    [self.contentView addSubview:self.imgListView];
    
    self.discussActionView.y = self.imgListView.bottom + 10;
    self.discussActionView.centerX = self.contentView.width * 0.5;
    [self.contentView addSubview:self.discussActionView];
    
    self.shareActionView.right = self.discussActionView.x;
    self.shareActionView.centerY = self.discussActionView.centerY;
    [self.contentView addSubview:self.shareActionView];
    
    self.likeActionView.x = self.discussActionView.right;
    self.likeActionView.centerY = self.discussActionView.centerY;
    [self.contentView addSubview:self.likeActionView];
    
    self.divideLineView.y = self.discussActionView.bottom;
    [self.contentView addSubview:self.divideLineView];
    
    self.contentView.height = self.divideLineView.bottom;
}

#pragma mark - set

- (void)setModel:(NewsModel *)model {
    _model = model;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
    self.titleLbe.text = model.title;
    [self.titleLbe sizeToFit];
    
    self.subTitleLbe.text = model.subTitle;
    [self.subTitleLbe sizeToFit];
    
    self.contentLbe.text = model.content;
    [self.contentLbe sizeToFit];
    
    [self.imgListView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.imgListView.y = self.contentLbe.bottom + 10;
    self.imgListView.height = 0;
    float posY = self.imgListView.bottom;
    
    if (model.imgs.count > 0) {
        __block float posX = 0;
        [model.imgs enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(posX, 0, kImgViewWH, kImgViewWH)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:obj]];
            [self.imgListView addSubview:imgView];
            posX += (5 + kImgViewWH);
            if (idx >= 3) {
                *stop = YES;
            }
        }];
        self.imgListView.height = kImgViewWH;
        posY = self.imgListView.bottom;
    }
    
    self.discussActionView.y = posY;
    [self.discussActionView updateTitle:[NSString stringWithFormat:@"%lu",(unsigned long)model.discussNum]];
    
    self.shareActionView.y = self.discussActionView.y;
    [self.shareActionView updateTitle:[NSString stringWithFormat:@"%lu",(unsigned long)model.shareNum]];
    
    self.likeActionView.y = self.discussActionView.y;
    [self.likeActionView updateTitle:[NSString stringWithFormat:@"%lu",(unsigned long)model.likeNum]];
    
    self.divideLineView.y = self.discussActionView.bottom;
}

#pragma mark - action

- (void)tapAttentionLbe {
    
}

- (void)tapDelete {
    
}

#pragma mark - private

- (UILabel *)getLbeWithFont:(float)font textColor:(UIColor *)textColor {
    UILabel *lbe = [[UILabel alloc] init];
    lbe.font = [UIFont systemFontOfSize:font];
    lbe.textColor = textColor;
    [lbe sizeToFit];
    return lbe;
}

#pragma mark - lazy

- (UIImageView *)iconImgView {
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    }
    return _iconImgView;
}

- (UILabel *)titleLbe {
    if (_titleLbe == nil) {
        _titleLbe = [self getLbeWithFont:16 textColor:[UIColor blackColor]];
    }
    return _titleLbe;
}

- (UILabel *)subTitleLbe {
    if (_subTitleLbe == nil) {
        _subTitleLbe = [self getLbeWithFont:14 textColor:[UIColor grayColor]];
    }
    return _subTitleLbe;
}

- (UILabel *)attentionLbe {
    if (_attentionLbe == nil) {
        _attentionLbe = [self getLbeWithFont:16 textColor:[UIColor redColor]];
        [_attentionLbe onTap:self action:@selector(tapAttentionLbe)];
    }
    return _attentionLbe;
}

- (UIImageView *)deleteImgView {
    if (_deleteImgView == nil) {
        _deleteImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wrong"]];
        [_deleteImgView onTap:self action:@selector(tapDelete)];
    }
    return _deleteImgView;
}

- (UILabel *)contentLbe {
    if (_contentLbe == nil) {
        _contentLbe = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 0)];
        _contentLbe.font = [UIFont systemFontOfSize:16];
        _contentLbe.textColor = [UIColor grayColor];
        _contentLbe.numberOfLines = 3;
    }
    return _contentLbe;
}

- (UIView *)imgListView {
    if (_imgListView == nil) {
        _imgListView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 0)];
    }
    return _imgListView;
}

- (NewsActionView *)shareActionView {
    if (_shareActionView) {
        _shareActionView = [[NewsActionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.33, 44) imgName:@"share" title:@"转发"];
    }
    return _shareActionView;
}

- (NewsActionView *)discussActionView {
    if (_discussActionView) {
        _discussActionView = [[NewsActionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.34, 44) imgName:@"message" title:@"0"];
    }
    return _discussActionView;
}

- (NewsActionView *)likeActionView {
    if (_likeActionView) {
        _likeActionView = [[NewsActionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.33, 44) imgName:@"like" title:@"0"];
    }
    return _likeActionView;
}

- (UIView *)divideLineView {
    if (_divideLineView == nil) {
        _divideLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
        _divideLineView.backgroundColor = [UIColor grayColor];
    }
    return _divideLineView;
}

@end
