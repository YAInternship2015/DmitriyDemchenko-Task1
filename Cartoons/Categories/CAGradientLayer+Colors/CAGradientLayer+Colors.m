//
//  CAGradientLayer+Colors.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/29/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "CAGradientLayer+Colors.h"

@implementation CAGradientLayer (Colors)

+ (CAGradientLayer *)gradientForFrame:(CGRect)frame fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = frame;
    gradient.colors = @[(id)[fromColor CGColor], (id)[toColor CGColor]];
    return gradient;
}

@end