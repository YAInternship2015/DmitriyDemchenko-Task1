//
//  CAGradientLayer+Colors.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/29/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAGradientLayer (Colors)

+ (CAGradientLayer *)gradientForFrame:(CGRect)frame fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor;

@end
