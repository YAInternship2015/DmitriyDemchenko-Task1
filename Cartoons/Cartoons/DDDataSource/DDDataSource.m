//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"
#import "DDCartoons.h"

@interface DDDataSource ()

@property (strong, nonatomic) NSArray *modelsArray;

@end


@implementation DDDataSource

+ (DDDataSource *)sharedManager
{
    static DDDataSource *manager = nil;
    static dispatch_once_t onceTaken;
    dispatch_once (&onceTaken, ^{
        manager = [[DDDataSource alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        DDCartoons *cartoon = [[DDCartoons alloc] init];
        _modelsArray = @[[cartoon getCartoonCharacters]];
    }
    return self;
}

- (id)objectFromModel:(NSUInteger)model index:(NSUInteger)index
{
    return [_modelsArray[model] objectAtIndex:index];
}

- (NSInteger)countOfModel:(NSUInteger)model
{
    return [_modelsArray[model] count];
}

@end