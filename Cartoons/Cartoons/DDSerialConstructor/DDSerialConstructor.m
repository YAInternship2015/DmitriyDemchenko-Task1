//
//  DDSerialConstructor.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDSerialConstructor.h"

@implementation DDSerialConstructor

#pragma mark - Alert

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Application Colors

+ (UIColor *)appYellowColor {
    return [UIColor colorWithRed:204.f/255.f green:255.f/255.f blue:102.f/255.f alpha:1.f];
}

+ (UIColor *)appPurpleColor {
    return [UIColor purpleColor];
}

+ (CAGradientLayer *)gradientForFrame:(CGRect)frame fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = frame;//[UIScreen mainScreen].bounds;
    gradient.colors = @[(id)[fromColor CGColor], (id)[toColor CGColor]];
    return gradient;
}

@end