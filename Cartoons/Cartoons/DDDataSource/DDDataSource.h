//
//  DDDataSource.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ModelsArrayIndex) {
    CartoonCharactersModel = 0
};

@interface DDDataSource : NSObject

+ (DDDataSource *)sharedManager;

- (NSInteger)countOfModel:(NSUInteger)model;
- (id)objectFromModel:(NSUInteger)model index:(NSUInteger)index;

@end