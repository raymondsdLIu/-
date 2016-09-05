//
//  LJRecommendCategoryCell.m
//  BaiSiFunny
//
//  Created by raymond on 16/9/5.
//  Copyright © 2016年 raymond. All rights reserved.
//

#import "LJRecommendCategoryCell.h"
#import "LJRecommendCategory.h"

@interface LJRecommendCategoryCell ()

@property (nonatomic, strong) UIView *selectedIndicator;
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation LJRecommendCategoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.top = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.top;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : LJColor(78, 78, 78);
}

- (void)setCategory:(LJRecommendCategory *)category {
    _category = category;
    self.textLabel.text = category.name;
}

#pragma mark - private

- (void)setupSubviews {
    self.backgroundColor = LJColor(244, 244, 244);
    [self.contentView addSubview:self.separatorLine];
    [self.contentView addSubview:self.selectedIndicator];
    NSDictionary *views =
        @{
          @"sl" : self.separatorLine,
          @"si" : self.selectedIndicator
          };
    [self.contentView
        addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:|-0-[si]-0-[sl(1)]-0-|"
                                               options:0
                                               metrics:nil
                                                 views:views]];
    [self.contentView
        addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"H:|-0-[si(5)]-0-[sl]-0-|"
                                               options:0
                                               metrics:nil
                                                 views:views]];
}

#pragma mark - getter

- (UIView *)selectedIndicator {
    if (!_selectedIndicator) {
        _selectedIndicator = [[UIView alloc] init];
        _selectedIndicator.translatesAutoresizingMaskIntoConstraints = NO;
//        _selectedIndicator.backgroundColor = [UIColor yellowColor];
        self.selectedIndicator.backgroundColor = LJColor(219, 21, 26);
    }
    return _selectedIndicator;
}

- (UIView *)separatorLine {
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.translatesAutoresizingMaskIntoConstraints = NO;
        _separatorLine.backgroundColor = [UIColor whiteColor];
    }
    return _separatorLine;
}

@end
