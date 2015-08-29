//
//  NSString+Validations.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+Validations.h"

@implementation NSString (Validations)

#warning сильно жирное расширение NSString выходит. Все же валидатор надо вынести в отдельный класс-валидатор
- (BOOL)isValidModelWithError:(NSError **)error {
    
    BOOL success = [[self predicateWithRegularExpression:@"[\\w\\s]{3,100}"] evaluateWithObject:self];
    NSString *errorMessage;
    NSInteger errorCode = 0;
    
    if (!success) {
//#warning все тексты, которые увидит пользователь, надо поместить в файл Localizable.strings. Почитайте в гугл, что это за файл и зачем он нужен
        errorMessage = NSLocalizedString(@"Name can't be less than 3 characters.", nil);
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

- (NSPredicate *)predicateWithRegularExpression:(NSString *)regExString {
    return [NSPredicate predicateWithFormat:@"SELF MATCHES[cd] %@", regExString];
}

@end