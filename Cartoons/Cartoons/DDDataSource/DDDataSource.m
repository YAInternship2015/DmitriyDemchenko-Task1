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
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNewModel:) name:NotificationDataFileContentDidChange object:nil];
    }
    return self;
}

- (NSArray *)getModels {
    return _charactersArray;
}

- (void)addNewModel:(NSDictionary *)model {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end