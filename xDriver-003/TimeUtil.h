//
//  TimeUtil.h
//  xDriver-003
//
//  Created by 林国强 on 15/6/17.
//  Copyright (c) 2015年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject

+ (NSString*)getTimeStr1:(long long)time;


+(NSString*) getTimeStrStyle1:(long long)time;
+ (NSString*)getTimeStr1Short:(long long)time;

+(NSString*) getTimeStrStyle2:(long long)time;

+(int)dayCountForMonth:(int)month andYear:(int)year;

+(BOOL)isLeapYear:(int)year;

@end
