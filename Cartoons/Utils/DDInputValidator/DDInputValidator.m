//
//  DDInputValidator.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/30/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDInputValidator.h"

@implementation DDInputValidator

static NSString *const RegularExpression = @"[\\w\\s]{3,100}";

//#warning сильно жирное расширение NSString выходит. Все же валидатор надо вынести в отдельный класс-валидатор (категория удалена)

+ (BOOL)validateInputString:(NSString *)string error:(NSError **)error {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[cd] %@", RegularExpression];
    BOOL success = [predicate evaluateWithObject:string];
    
    NSString *errorMessage;
    NSInteger errorCode = 0;
    
    if (!success) {
        errorMessage = NSLocalizedString(@"Name can't be less than 3 characters", nil);
        errorCode = 9000;
        
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : errorMessage};
        
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"TestTask2" code:errorCode userInfo:userInfo];
        }
        
        [UIAlertView showAlertWithMessage:userInfo[NSLocalizedDescriptionKey]];
        
        return NO;
    }
    return YES;
}

@end