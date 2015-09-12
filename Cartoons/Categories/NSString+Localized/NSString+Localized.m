//
//  NSString+Localized.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 9/12/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+Localized.h"

@implementation NSString (Localized)

- (NSString *)localized {
    return NSLocalizedString(self, @"");
}

@end