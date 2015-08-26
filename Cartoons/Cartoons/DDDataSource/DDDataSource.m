//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"
#import "DDCharacterFactory.h"
#import "NSString+ResourcePath.h"

@interface DDDataSource ()

@property (strong, nonatomic) NSArray *charactersArray;

@end


@implementation DDDataSource

#pragma mark - Lifecycle

//- (instancetype)init {
//    self = [super init];
//    if (self) {
////        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveTestNotification:) name:NotificationDataFileContentDidChange object:nil];
//        [self loadArrayWithPlist];
//    }
//    return self;
//}

- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testMethod) name:NotificationDataFileContentDidChange object:nil];
        [self loadArrayWithPlist];
    }
    return self;
}

- (void)testMethod {
    NSLog(@"CALL");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)receiveTestNotification:(NSNotification *)notification {
    if ([[notification name] isEqualToString:NotificationDataFileContentDidChange])
        NSLog (@"Successfully received the test notification!");
}

#pragma mark - Private methods

- (NSArray *)getModels {
    return _charactersArray;
}

- (void)loadArrayWithPlist {
    _charactersArray = [NSArray arrayWithContentsOfFile:[NSString documentsFolderPath]];
    [self.delegate dataWasChanged];
}

@end