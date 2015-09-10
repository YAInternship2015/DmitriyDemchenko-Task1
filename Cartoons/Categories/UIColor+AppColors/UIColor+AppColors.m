//
//  UIColor+AppColors.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/29/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "UIColor+AppColors.h"

@implementation UIColor (AppColors)

#pragma mark - Random color

+ (UIColor *)randomColor {
    CGFloat redLevel = rand() / (float) RAND_MAX;
    CGFloat greenLevel = rand() / (float) RAND_MAX;
    CGFloat blueLevel = rand() / (float) RAND_MAX;
    return [UIColor colorWithRed:redLevel green:greenLevel blue:blueLevel alpha:0.1f];
}

#pragma mark - Application colors

//#warning цвета надо вынести в категорию UIColor

+ (UIColor *)appYellowColor {
    return [UIColor colorWithRed:204.f/255.f green:255.f/255.f blue:102.f/255.f alpha:1.f];
}

+ (UIColor *)appPurpleColor {
    return [UIColor purpleColor];
}

@end