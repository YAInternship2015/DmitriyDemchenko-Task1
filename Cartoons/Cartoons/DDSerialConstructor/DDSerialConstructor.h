//
//  DDSerialConstructor.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDSerialConstructor : NSObject

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate;

+ (UIColor *)appYellowColor;
+ (UIColor *)appPurpleColor;

@end