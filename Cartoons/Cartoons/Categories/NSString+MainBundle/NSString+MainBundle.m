//
//  NSString+MainBundle.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+MainBundle.h"

@implementation NSString (MainBundle)

+ (NSString *)documentFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    return paths[0];
}

//+ (NSString *)dataSourcePath {
//    return [[NSString documentFolderPath] stringByAppendingPathComponent:@"Characters.plist"];
//}



+ (NSString *)dataSourcePath {
    return [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"];
}

@end
