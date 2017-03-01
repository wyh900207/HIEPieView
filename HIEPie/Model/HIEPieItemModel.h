//
//  HIEPieItemModel.h
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HIEPieItemModel : NSObject

@property (assign, nonatomic) CGFloat   startAngle;         // pie 的 起始弧度
@property (assign, nonatomic) CGFloat   endAngle;           // pie 的 结束弧度
@property (assign, nonatomic) CGFloat   middleAngle;        // pie 的 中心点弧度
@property (assign, nonatomic) NSInteger index;              // pie 的 索引
@property (copy  , nonatomic) NSString *itemName;           // item 名称
@property (assign, nonatomic) CGFloat   itemNumber;         // pie 的 金额
@property (copy  , nonatomic) NSString *percent;            // 百分比

@end
