//
//  DDCreateCharacter.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCreateCharacter.h"

@implementation DDCreateCharacter

+ (NSDictionary *)newModelFrom:(NSString *)string {
    NSDictionary *dict = [NSDictionary dictionary];
    [dict setValue:string forKey:kName];
    [dict setValue:NoImage forKey:kImageName];
    return dict;
}

@end
