//
//  NSString+StringFromDate.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+StringFromDate.h"

static NSString *const DateFormatHHmmss = @"HH:mm:ss";

@implementation NSString (StringFromDate)

+ (NSString *)stringWithDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:NSLocalizedString(@"en_US", nil)]];
    [dateFormatter setDateFormat:DateFormatHHmmss];
    
    return [dateFormatter stringFromDate:date];
}

@end