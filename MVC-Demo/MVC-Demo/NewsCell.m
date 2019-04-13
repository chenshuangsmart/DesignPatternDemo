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
    [self.contentView addSubview:self.iconImgView];
    [self.contentView addSubview:self.titleLbe];
    [self.contentView addSubview:self.subTitleLbe];
    [self.contentView addSubview:self.deleteImgView];
    [self.contentView addSubview:self.attentionLbe];
    [self.contentView addSubview:self.contentLbe];
    [self.contentView addSubview:self.imgListView];
    [self.contentView addSubview:self.discussActionView];
    [self.contentView addSubview:self.shareActionView];
    [self.contentView addSubview:self.likeActionView];
    [self.contentView addSubview:self.divideLineView];
    
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
        make.size.mas_equalTo(self.deleteImgView.size);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-10);
        make.centerY.equalTo(self.iconImgView.mas_centerY);
    }];
    
    [self.attentionLbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-40);
        make.centerY.equalTo(self.iconImgView.mas_centerY);
    }];
    
    [self.contentLbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(10);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-10);
        make.top.equalTo(self.iconImgView.mas_bottom).offset(10);
    }];
    
    [self.imgListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(10);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-10);
        make.top.equalTo(self.contentLbe.mas_bottom).offset(10);
        make.height.mas_equalTo(0);
    }];
    
    [self.discussActionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgListView.mas_bottom).offset(10);
        make.size.mas_equalTo(self.discussActionView.size);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    [self.shareActionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discussActionView.mas_top);
        make.size.mas_equalTo(self.shareActionView.size);
        make.trailing.equalTo(self.discussActionView.mas_leading);
    }];
    
    [self.likeActionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discussActionView.mas_top);
        make.size.mas_equalTo(self.likeActionView.size);
        make.leading.equalTo(self.discussActionView.mas_trailing);
    }];
    
    [self.divideLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(5);
        make.top.equalTo(self.discussActionView.mas_bottom);
        //===== 底部对齐是撑开cell的关键点 =====//
        make.bottom.mas_equalTo(self.contentView);
    }];
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
    
    if (model.isAttention) {
        self.attentionLbe.text = @"已关注";
        self.attentionLbe.textColor = [UIColor grayColor];
        self.attentionLbe.userInteractionEnabled = NO;
    } else {
        self.attentionLbe.text = @"关注";
        self.attentionLbe.textColor = [UIColor redColor];
        self.attentionLbe.userInteractionEnabled = YES;
    }
    [self.attentionLbe sizeToFit];
    [self.contentLbe mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-40);
    }];
    
    [self.imgListView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    float imgListViewHeight = 0;
    float discussActionViewPosY = 0;
    
    if (model.imgs.count > 0) {
        __block float posX = 0;
        [model.imgs enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(posX, 0, kImgViewWH, kImgViewWH)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:obj]];
            imgView.layer.cornerRadius = 2;
            imgView.layer.masksToBounds = YES;
            [self.imgListView addSubview:imgView];
            posX += (5 + kImgViewWH);
            if (idx >= 3) {
                *stop = YES;
            }
        }];
        imgListViewHeight = kImgViewWH;
        discussActionViewPosY = 10;
    }
    
    [self.imgListView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(imgListViewHeight);
    }];
    
    [self.discussActionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgListView.mas_bottom).offset(discussActionViewPosY);
    }];
    
    [self.shareActionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discussActionView.mas_top);
    }];
    
    [self.likeActionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discussActionView.mas_top);
    }];
    
    if (model.isLike) {
        [self.likeActionView updateImgName:@"like_red"];
    } else {
        [self.likeActionView updateImgName:@"like"];
    }
    
    [self.discussActionView updateTitle:[NSString stringWithFormat:@"%lu",(unsigned long)model.discussNum]];
    [self.shareActionView updateTitle:[NSString stringWithFormat:@"%lu",(unsigned long)model.shareNum]];
    [self.likeActionView updateTitle:[NSString stringWithFormat:@"%lu",(unsigned long)model.likeNum]];
    
    [self.divideLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discussActionView.mas_bottom);
        make.bottom.mas_equalTo(self.contentView);
    }];
}

#pragma mark - action

- (void)tapAttentionLbe {
    if ([self.delegate respondsToSelector:@selector(didTapNewsCellAttention:)]) {
        [self.delegate didTapNewsCellAttention:self.model];
    }
}

- (void)tapDelete {
    if ([self.delegate respondsToSelector:@selector(didTapNewsCellDelete:)]) {
        [self.delegate didTapNewsCellDelete:self.model];
    }
}

- (void)tapShare {
    if ([self.delegate respondsToSelector:@selector(didTapNewsCellShare:)]) {
        [self.delegate didTapNewsCellShare:self.model];
    }
}

- (void)tapDiscuss {
    if ([self.delegate respondsToSelector:@selector(didTapNewsCellDiscuss:)]) {
        [self.delegate didTapNewsCellDiscuss:self.model];
    }
}

- (void)tapLike {
    if ([self.delegate respondsToSelector:@selector(didTapNewsCellLike:)]) {
        [self.delegate didTapNewsCellLike:self.model];
    }
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
        _iconImgView.layer.cornerRadius = 22;
        _iconImgView.layer.masksToBounds = YES;
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
        _attentionLbe.text = @"关注";
        [_attentionLbe sizeToFit];
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
    if (_shareActionView == nil) {
        _shareActionView = [[NewsActionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.33, 44) imgName:@"share" title:@"转发"];
        [_shareActionView onTap:self action:@selector(tapShare)];
    }
    return _shareActionView;
}

- (NewsActionView *)discussActionView {
    if (_discussActionView == nil) {
        _discussActionView = [[NewsActionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.34, 44) imgName:@"message" title:@"0"];
        [_discussActionView onTap:self action:@selector(tapDiscuss)];
    }
    return _discussActionView;
}

- (NewsActionView *)likeActionView {
    if (_likeActionView == nil) {
        _likeActionView = [[NewsActionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth * 0.33, 44) imgName:@"like" title:@"0"];
        [_likeActionView onTap:self action:@selector(tapLike)];
    }
    return _likeActionView;
}

- (UIView *)divideLineView {
    if (_divideLineView == nil) {
        _divideLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
        _divideLineView.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245/255.0 blue:245/255.0 alpha:1];
    }
    return _divideLineView;
}

@end
