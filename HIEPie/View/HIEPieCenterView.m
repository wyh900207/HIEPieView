//
//  HIEPieCenterView.m
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import "HIEPieCenterView.h"

@interface HIEPieCenterView ()

@property (strong, nonatomic) UIImageView *backgroundImage;     // 背景图片
@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation HIEPieCenterView

#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI

- (void)setupUI {
    [self addSubview:self.backgroundImage];
    [self addSubview:self.textLabel];
}

#pragma mark - 懒加载

- (UIImageView *)backgroundImage {
    if (_backgroundImage == nil) {
        _backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pie_center_img.png"]];
        _backgroundImage.frame = self.bounds;
    }
    return _backgroundImage;
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        _textLabel = [UILabel new];
        _textLabel.center = self.center;
        _textLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, 40);
        _textLabel.text = @"abc";
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:15];
    }
    return _textLabel;
}

#pragma mark - Setter

- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}

- (void)setModel:(HIEPieItemModel *)model {
    _model = model;
    self.textLabel.text = [NSString stringWithFormat:@"%@\n%@%@", model.itemName, model.percent, @"%"];
}

@end
