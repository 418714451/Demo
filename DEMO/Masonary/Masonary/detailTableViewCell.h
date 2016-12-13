//
//  detailTableViewCell.h
//  Masonary
//
//  Created by 杜昕宇 on 16/11/2.
//  Copyright © 2016年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UILabel *subLabel;

@property (nonatomic, strong) UIView *rightLineView;

@property (nonatomic, strong) UILabel *placeLabel;

@property (nonatomic, strong) UILabel *numberLabel;


+ (detailTableViewCell *)detailTableViewCellByTableView:(UITableView *)tableView;
@end
