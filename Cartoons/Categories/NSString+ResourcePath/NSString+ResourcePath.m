//
//  NSString+ResourcePath.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+ResourcePath.h"

static NSString *const ResourceName = @"Characters";
static NSString *const ResourceType = @"plist";

@implementation NSString (ResourcePath)

+ (NSString *)documentsFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    NSString *resourceNameDotType = [[ResourceName stringByAppendingString:@"."] stringByAppendingString:ResourceType];
    return [documentsDirectory stringByAppendingPathComponent:resourceNameDotType]; // @"Characters.plist"
}

+ (NSString *)resourcesFolderPath {
    return [[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType];
}

@end