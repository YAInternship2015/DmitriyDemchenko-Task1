//
//  NSString+Validations.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+Validations.h"

@implementation NSString (Validations)

- (BOOL)isValidModelWithError:(NSError **)error {
    
    BOOL success = [[self predicateWithRegularExpression:@"[\\w\\s]{3,100}"] evaluateWithObject:self];
    NSString *errorMessage;
    NSInteger errorCode = 0;
    
    if (!success) {
        
        errorMessage = @"Name can't be less than 3 characters.";
        errorCode = 9000;
        
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : errorMessage};
        
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"TestTask2" code:errorCode userInfo:userInfo];
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:userInfo[NSLocalizedDescriptionKey] delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
        
        return NO;
    }
    return YES;
}

- (NSPredicate *)predicateWithRegularExpression:(NSString *)regExString {
    return [NSPredicate predicateWithFormat:@"SELF MATCHES[cd] %@", regExString];
}

@end