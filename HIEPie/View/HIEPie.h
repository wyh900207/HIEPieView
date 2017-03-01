//
//  HIEPie.h
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HIEPieItemModel;

@interface HIEPie : UIView

- (instancetype)initWithCenter:(CGPoint)centerPoint
                        radius:(CGFloat)radius
                         items:(NSArray<HIEPieItemModel *> *)models;

@end
