//
//  NSString+Validations.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validations)

- (BOOL)isValidModelWithError:(NSError **)error;

@end