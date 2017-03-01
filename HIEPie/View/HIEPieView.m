//
//  HIEPieView.m
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import "HIEPieView.h"
#import "HIEPieItem.h"
#import "HIEPie.h"
#import "HIEPieItemModel.h"
#import "HIEPieCenterView.h"

@interface HIEPieView ()

@property (strong, nonatomic) NSArray<HIEPieItem *> *items;
@property (strong, nonatomic) HIEPie  *pie;                         // 饼
@property (strong, nonatomic) HIEPieCenterView *pieCenterView;      // 中心的 刻度 圆
@property (assign, nonatomic) CGAffineTransform startTransform;

@end

@implementation HIEPieView

#pragma mark - 初始化

- (instancetype)initWithItems:(NSArray<HIEPieItem *> *)items frame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.items = items;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.pie];
    [self addSubview:self.pieCenterView];
    [self startAnimation];
    self.startTransform = self.pie.transform;
}

#pragma mark - 懒加载

- (HIEPie *)pie {
    if (_pie == nil) {
        _pie = [[HIEPie alloc] initWithCenter:self.center radius:self.bounds.size.width * 0.4 items:[self transformItemToItemModel]];
        _pie.frame = self.bounds;
        _pie.backgroundColor = [UIColor clearColor];
    }
    return _pie;
}

- (HIEPieCenterView *)pieCenterView {
    if (_pieCenterView == nil) {
        _pieCenterView = [[HIEPieCenterView alloc] initWithFrame:CGRectMake(0, 0, 128, 150)];
        _pieCenterView.center = self.center;
        _pieCenterView.backgroundColor = [UIColor clearColor];
        _pieCenterView.layer.masksToBounds = YES;
    }
    return _pieCenterView;
}

#pragma mark - 私有方法

// HIEPieItemModel -> HIEPieItem

- (NSArray<HIEPieItemModel *> *)transformItemToItemModel {
    CGFloat sumSalary = 0;
    NSMutableArray<HIEPieItemModel *> *models = [NSMutableArray arrayWithCapacity:self.items.count];
    for (HIEPieItem *item in self.items) {
        sumSalary += item.itemNumber;
    }

    for (int i = 0; i < self.items.count; i++) {
        HIEPieItemModel *m = [HIEPieItemModel new];
        if (i == 0) {
            m.startAngle = 0;
            m.endAngle = self.items[0].itemNumber / sumSalary * 2 * M_PI;
            m.middleAngle = (m.startAngle + m.endAngle) * 0.5;
            m.index = i;
            m.percent = [NSString stringWithFormat:@"%.2f", self.items[0].itemNumber / sumSalary * 100];
            m.itemName = self.items[i].itemName;
            m.itemNumber = self.items[i].itemNumber;
        } else {
            m.startAngle = models[i - 1].endAngle;
            m.endAngle = models[i - 1].endAngle + (self.items[i].itemNumber / sumSalary * 2 * M_PI);
            m.middleAngle = models[i - 1].endAngle + (self.items[i].itemNumber / sumSalary * 2 * M_PI) * 0.5;
            m.index = i;
            m.percent = [NSString stringWithFormat:@"%.2f", self.items[i].itemNumber / sumSalary * 100];
            m.itemName = self.items[i].itemName;
            m.itemNumber = self.items[i].itemNumber;
        }
        [models addObject:m];
    }
    return models;
}

- (float)calculateDistanceFromCenter:(CGPoint)point {
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    float dx = point.x - center.x;
    float dy = point.y - center.y;
    return sqrt(dx * dx + dy * dy);
}

// 初始化时候的动画(把某一个item显示在最中间)

- (void)startAnimation {
    CGFloat radians = atan2(self.pie.transform.b, self.pie.transform.a);
    CGFloat newVal = 0.0;

    radians = radians > 0 ? radians : 2 * M_PI + radians;
    radians = 2 * M_PI - radians;
    radians += M_PI_2;
    radians = radians > 2 * M_PI ? radians - 2 * M_PI : radians;

    NSArray<HIEPieItemModel *> *models = [self transformItemToItemModel];
    for (int i = 0; i < self.items.count; i++) {
        HIEPieItemModel *model = models[i];
        if (model.startAngle < radians && radians < model.endAngle) {
            newVal = model.middleAngle - radians;
            self.pieCenterView.model = models[i];
        }
    }

    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform t = CGAffineTransformRotate(self.pie.transform, -newVal);
        self.pie.transform = t;
    }];
}

#pragma mark - 触摸手势

static float deltaAngle;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint delta = [touch locationInView:self];

    self.startTransform = self.pie.transform;

    float dx = delta.x  - self.pie.center.x;
    float dy = delta.y  - self.pie.center.y;
    deltaAngle = atan2(dy,dx);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];

    float dx = point.x - self.pie.center.x;
    float dy = point.y - self.pie.center.y;
    float angle = atan2(dy, dx);

    float angleDif = deltaAngle - angle;

    CGAffineTransform newTransform = CGAffineTransformRotate(self.startTransform, -angleDif);
    self.pie.transform = newTransform;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self startAnimation];
}

@end
