//
//  DDCreateCharacter.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterFactory.h"

@implementation DDCharacterFactory

+ (NSDictionary *)modelWithName:(NSString *)name {
    return @{kName : name, kImageName : NoImage};
}

@end