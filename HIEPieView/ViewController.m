//
//  ViewController.m
//  HIEPieView
//
//  Created by 王源鸿 on 2017/3/1.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

#import "ViewController.h"
#import "HIEPieView.h"
#import "HIEPieItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    HIEPieView *pieView = [[HIEPieView alloc] initWithItems:[self getDatasource] frame:self.view.bounds];
    pieView.center = self.view.center;
    pieView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pieView];
}

- (NSArray *)getDatasource {
    HIEPieItem *item1 = [HIEPieItem new];
    item1.itemName = @"工资";
    item1.itemNumber = 7890;

    HIEPieItem *item2 = [HIEPieItem new];
    item2.itemName = @"奖金";
    item2.itemNumber = 2231;

    HIEPieItem *item3 = [HIEPieItem new];
    item3.itemName = @"分红";
    item3.itemNumber = 5432;

    HIEPieItem *item4 = [HIEPieItem new];
    item4.itemName = @"其他";
    item4.itemNumber = 5328;

    return @[item1, item2, item3, item4];
}


@end
