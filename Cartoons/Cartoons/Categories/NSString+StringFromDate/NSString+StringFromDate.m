//
//  NSString+StringFromDate.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+StringFromDate.h"

static NSString *const DateFormatFromServer =               @"yyyy-MM-dd HH:mm:ss";
static NSString *const RequestDateFormat =                  @"yyyy-MM-dd";
static NSString *const DepartureDateButtonFormat =          @"E, d MMMM yyyy";
static NSString *const DepartureArrivalLabelDateFormat =    @"E, d MMM, HH:mm";
static NSString *const PrefixForModelName =                 @"dd.MM, HH:mm";

static NSString *const LocaleIdentifierRU =  @"ru_RU";
static NSString *const LocaleIdentifierUA =  @"uk_UA";
static NSString *const LocaleIdentifierUS =  @"en_US";

@implementation NSString (StringFromDate)

+ (NSString *)stringWithDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:LocaleIdentifierUS]];
    [dateFormatter setDateFormat:PrefixForModelName];
    
    return [dateFormatter stringFromDate:date];
}

@end
