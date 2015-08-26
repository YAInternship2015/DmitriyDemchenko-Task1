//
//  DDCreateCharacter.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterFactory.h"

@implementation DDCharacterFactory

+ (DDCharacterFactory *)newModelWithName:(NSString *)name {
    DDCharacterFactory *model = [[DDCharacterFactory alloc] init];
    model.name = name;
    model.imageName = @"NoImage";
    return model;
}

@end