//
//  HIEPieItem.h
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HIEPieItem : NSObject

@property (copy  , nonatomic) NSString *itemName;         // item 名称
@property (assign, nonatomic) CGFloat   itemNumber;       // pie 的 金额

@end
