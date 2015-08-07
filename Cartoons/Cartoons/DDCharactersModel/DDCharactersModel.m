//
//  Characters.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharactersModel.h"

@implementation DDCharactersModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cartoonCharacters = @[@"Daisy", @"Donald", @"Goofy", @"Jerry", @"Lion", @"Mickey", @"Minnie", @"Monkey", @"Pluto", @"Tweety"];
    }
    return self;
}

@end