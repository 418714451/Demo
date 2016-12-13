//
//  detailTableViewCell.m
//  Masonary
//
//  Created by 杜昕宇 on 16/11/2.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "detailTableViewCell.h"

#import "Masonry.h"

@implementation detailTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatView];
    }
    return self;

}

+ (detailTableViewCell *)detailTableViewCellByTableView:(UITableView *)tableView{
    static NSString *cellIdentify = @"cellidentify";
    detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentify];
    }

    return cell;
}

- (void)creatView{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.subLabel];
    [self.contentView addSubview:self.rightLineView];
    [self.contentView addSubview:self.placeLabel];
    [self.contentView addSubview:self.numberLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.top.equalTo(self.contentView).offset(16);
        make.bottom.equalTo(self.contentView).offset(-16);
        make.width.equalTo(self.iconImageView.mas_height);
    }];

    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(26);
        make.top.equalTo(self.iconImageView.mas_top).offset(9);
        make.size.mas_equalTo(CGSizeMake(150, 15));
    }];

    [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.and.height.equalTo(self.detailLabel);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(20);
    }];

    [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.bottom.equalTo(self.contentView).offset(-12);
        make.left.equalTo(self.detailLabel.mas_right).offset(16);
        make.size.mas_equalTo(CGSizeMake(0.5, 0));
        
    }];

    [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLineView.mas_right).offset(26);
        make.size.mas_equalTo(CGSizeMake(12, 14));
        make.top.equalTo(self.contentView).offset(50);
    }];

    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.placeLabel.mas_right).offset(2);
        make.bottom.equalTo(self.placeLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }];
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor cyanColor];
    }
    return _iconImageView;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.text = @"各种虾条50g";
    }
    return _detailLabel;
}

- (UILabel *)subLabel{
    if (!_subLabel) {
        _subLabel = [UILabel new];
        _subLabel.text = @"虾尾";
        _subLabel.font = [UIFont systemFontOfSize:12];
        _subLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    }
    return _subLabel;
}

- (UIView *)rightLineView{
    if (!_rightLineView) {
        _rightLineView = [UIView new];
        _rightLineView.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    }
    return _rightLineView;
}

- (UILabel *)placeLabel{
    if (!_placeLabel) {
        _placeLabel = [UILabel new];
        _placeLabel.text = @"#";
        _placeLabel.font = [UIFont systemFontOfSize:16];
    }
    return _placeLabel;
}

- (UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [UILabel new];
        _numberLabel.text = @"123";
        _numberLabel.textAlignment = NSTextAlignmentLeft;
        _numberLabel.font = [UIFont systemFontOfSize:24];
    }
    return _numberLabel;
}
@end
