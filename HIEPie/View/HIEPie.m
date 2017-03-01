//
//  HIEPie.m
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import "HIEPie.h"
#import "HIEPieItemModel.h"

@interface HIEPie ()

@property (assign, nonatomic) CGPoint centerPoint;                  // pie 的 中心点
@property (assign, nonatomic) CGFloat radius;                       // pie 的 半径
@property (strong, nonatomic) NSArray<HIEPieItemModel *> *models;   // pie model

@end

@implementation HIEPie

- (instancetype)initWithCenter:(CGPoint)centerPoint radius:(CGFloat)radius items:(NSArray<HIEPieItemModel *> *)models {
    if (self = [super init]) {
        self.centerPoint = centerPoint;
        self.radius = radius;
        self.models = models;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();

    for (HIEPieItemModel *model in self.models) {
        [self drawPieItemWith:model context:contextRef];
    }
}

- (void)drawPieItemWith:(HIEPieItemModel *)model context:(CGContextRef)context {
    NSArray<UIColor *> *colors = [self colors];
    CGContextMoveToPoint(context, self.centerPoint.x, self.centerPoint.y);
    CGContextSetFillColor(context, CGColorGetComponents(colors[model.index].CGColor));
    CGContextAddArc(context, self.centerPoint.x, self.centerPoint.y, self.radius, model.startAngle, model.endAngle, 0);
    CGContextFillPath(context);
}

- (NSArray<UIColor *> *)colors {
    return @[[UIColor redColor],
            [UIColor orangeColor],
            [UIColor blueColor],
            [UIColor purpleColor]
            ];
}

@end
