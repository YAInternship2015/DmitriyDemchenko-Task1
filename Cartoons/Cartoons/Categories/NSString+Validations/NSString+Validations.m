//
//  Validations.m
//  TRAVLR
//
//  Created by Mykhailo Glagola on 08.05.15.
//  Copyright (c) 2015 Buzinga. All rights reserved.
//

#import "NSString+Validations.h"

static NSString *const emailRegEx = @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
static NSString *const passwordRegEx = @"[A-Za-z0-9_-]{6,32}";
static NSString *const userNameRegEx = @"[\\w\\s]{1,100}";

@implementation NSString (Validations)

#pragma mark - Public

- (BOOL)isValidEmail
{
    return [[self predicateWithRegularExpression:emailRegEx] evaluateWithObject:self];
}

- (BOOL)isValidPassword
{
    return [[self predicateWithRegularExpression:passwordRegEx] evaluateWithObject:self];
}

- (BOOL)isValidUserName
{
    return [[self predicateWithRegularExpression:userNameRegEx] evaluateWithObject:self];
}

- (BOOL)validateWithRegularExpression:(NSString *)regExString
{
    return [[self predicateWithRegularExpression:regExString] evaluateWithObject:self];
}

#pragma mark - Private

- (NSPredicate *)predicateWithRegularExpression:(NSString *)regExString
{
    return [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", regExString];
}

@end
