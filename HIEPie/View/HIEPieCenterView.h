//
//  HIEPieCenterView.h
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HIEPieItemModel.h"

@interface HIEPieCenterView : UIView

@property (copy  , nonatomic) NSString *text;                // 文本
@property (strong, nonatomic) HIEPieItemModel *model;        // 设置 中心区域的 文本

@end
