//
//  MileChartViewController.m
//  xDriver-003
//
//  Created by 林国强 on 15/6/15.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import "MileChartViewController.h"
#import "UUChart.h"
#import "MileSql.h"

UUChart *chartView;

@interface MileChartViewController ()<UUChartDataSource>

//需要展示的Mile数据集合
@property (nonatomic, copy) NSDictionary *mileDict;

@end

@implementation MileChartViewController

- (NSDictionary *)mileDict{
    if (_mileDict == nil) {
        _mileDict = [MileSql groupByDay];
    }
    return _mileDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    
    
    chartView = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(10, 50, [UIScreen mainScreen].bounds.size.width - 20, 200) withSource:self withStyle:UUChartBarStyle];
    
    [chartView showInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    
    NSMutableArray *xTitles = [NSMutableArray array];
    for (NSString *key in self.mileDict) {
        [xTitles addObject:key];
    }
    return xTitles;
}
//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSMutableArray *ary = [NSMutableArray array];
    
    for (NSString *key in self.mileDict) {
        [ary addObject:[self.mileDict valueForKey:key]];
    }
    
    return @[ary];
}

#pragma mark - @optional
//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUGreen,UURed,UUBrown];
}
//显示数值范围
- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
{
    return CGRangeMake(300, 0);
    
}

@end
