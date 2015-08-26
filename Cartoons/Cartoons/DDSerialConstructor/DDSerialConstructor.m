//
//  DDSerialConstructor.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDSerialConstructor.h"

@implementation DDSerialConstructor

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
}

@end