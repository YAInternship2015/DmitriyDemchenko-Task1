//
//  DDDataSource.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

@class DDCharacterFactory;

#import <Foundation/Foundation.h>

@protocol DDModelsDataSourceDelegate;


@interface DDDataSource : NSObject

@property (weak, nonatomic) id<DDModelsDataSourceDelegate>delegate;

- (NSArray *)getModels;
- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate;

@end


@protocol DDModelsDataSourceDelegate <NSObject>

@required
- (void)dataWasChanged:(DDDataSource *)dataSource;

@end