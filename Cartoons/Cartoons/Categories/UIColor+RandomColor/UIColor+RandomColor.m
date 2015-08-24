//
//  UIColor+RandomColor.m
//  Etsy
//
//  Created by Dmitriy Demchenko on 7/9/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor
{
    CGFloat redLevel = rand() / (float) RAND_MAX;
    CGFloat greenLevel = rand() / (float) RAND_MAX;
    CGFloat blueLevel = rand() / (float) RAND_MAX;
    
    return [UIColor colorWithRed:redLevel green:greenLevel blue:blueLevel alpha:0.1f];
}

@end