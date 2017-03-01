//
//  HIEPieView.h
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HIEPieItem;

@interface HIEPieView : UIView

- (instancetype)initWithItems:(NSArray<HIEPieItem *> *)items frame:(CGRect)frame;

@end
