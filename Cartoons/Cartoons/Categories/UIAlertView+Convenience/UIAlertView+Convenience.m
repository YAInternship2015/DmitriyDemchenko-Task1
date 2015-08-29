//
//  UIAlertView+Convenience.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/29/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "UIAlertView+Convenience.h"

@implementation UIAlertView (Convenience)

+ (void)showAlertWithMessage:(NSString *)message {
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
}

@end