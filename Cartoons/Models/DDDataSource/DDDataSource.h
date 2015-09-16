//
//  DDDataSource.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

//@class DDCharacterFactory;

#import <Foundation/Foundation.h>

@protocol DDModelsDataSourceDelegate;


@interface DDDataSource : NSObject

@property (nonatomic, weak) id<DDModelsDataSourceDelegate>delegate;

- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate;
- (NSUInteger)numberOfModels;
- (DDCharacter *)modelForIndex:(NSInteger)index;
- (void)removeModelAtIndex:(NSIndexPath *)indexPath;

@end


@protocol DDModelsDataSourceDelegate <NSObject>

@required
- (void)contentWasChangedAtIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath;

@end