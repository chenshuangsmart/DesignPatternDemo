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
    
    self.iconImgView.x = 10;
    self.iconImgView.y = 10;
    [self.contentView addSubview:self.iconImgView];
    
    self.titleLbe.x = self.iconImgView.right + 10;
    self.titleLbe.bottom = self.iconImgView.centerY - 2;
    [self.contentView addSubview:self.titleLbe];
    
    self.subTitleLbe.x = self.titleLbe.x;
    self.subTitleLbe.y = self.iconImgView.centerY + 2;
    [self.contentView addSubview:self.subTitleLbe];
    
    self.deleteImgView.right = self.contentView.width - 10;
    self.deleteImgView.centerY = self.iconImgView.centerY;
    [self.contentView addSubview:self.deleteImgView];
    
    self.attentionLbe.right = self.deleteImgView.x - 20;
    self.attentionLbe.centerY = self.iconImgView.centerY;
    [self.contentView addSubview:self.attentionLbe];
    
    self.contentLbe.y = self.iconImgView.bottom + 10;
    self.contentLbe.x = 10;
    [self.contentView addSubview:self.contentLbe];
    
    self.discussActionView.y = self.contentLbe.bottom + 10;
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
}

#pragma mark - set

- (void)setModel:(NewsModel *)model {
    _model = model;
    self.iconImgView.image = [UIImage imageNamed:<#(nonnull NSString *)#>]
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
        _imgListView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 20, 0)];
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
