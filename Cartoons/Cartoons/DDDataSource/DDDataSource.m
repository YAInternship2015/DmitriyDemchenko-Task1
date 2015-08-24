//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"

@interface DDDataSource ()

@property (strong, nonatomic) NSArray *charactersArray;

@end


@implementation DDDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"];
        _charactersArray = [NSArray arrayWithContentsOfFile:path];
    }
    return self;
}

- (NSArray *)getModels {
    return _charactersArray;
}

@end