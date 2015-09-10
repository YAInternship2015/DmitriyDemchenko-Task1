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

//- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate;
- (NSFetchedResultsController *)getFetchedResultsController;

@end


@protocol DDModelsDataSourceDelegate <NSObject>

@required
- (void)dataWasChanged:(DDDataSource *)dataSource;

@end