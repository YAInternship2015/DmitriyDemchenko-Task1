//
//  Validations.h
//  TRAVLR
//
//  Created by Mykhailo Glagola on 08.05.15.
//  Copyright (c) 2015 Buzinga. All rights reserved.
//

#import <Foundation/Foundation.h>
/*! NSString category for check if string meets requirements
 */
@interface NSString (Validations)

/*! Check if string is email
 @return YES if email is correct; NO if string in not valid email
 */
- (BOOL)isValidEmail;

/*! Check if string contain minimum 6 characters, less as 32 characters and contain only alphabet, numeric, "_" and "-" symbols
 @return YES if string meets requirements
 */
- (BOOL)isValidPassword;

/*! Check if string contain minimum 1 character, and containts only alphabeth, numeric symbols
 @return YES if string meets requirements
 */
- (BOOL)isValidUserName;

/*! Check if string meets requirements descripted on regular expression string
 @param NSString regular expression string
 @return YES if string meets requirements
 */
- (BOOL)validateWithRegularExpression:(NSString *)regExString;

@end
