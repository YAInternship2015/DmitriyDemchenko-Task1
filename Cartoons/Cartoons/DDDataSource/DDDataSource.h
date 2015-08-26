//
//  DDDataSource.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

@class DDCharacterFactory;

#import <Foundation/Foundation.h>

//@protocol DDDataSourceDelegate <NSObject>
//
//- (void)dataSourceIsUpdated;
//
//@end

@interface DDDataSource : NSObject

//@property (nonatomic, weak) id<DDDataSourceDelegate>delegate;

+ (void)addCharacter:(DDCharacterFactory *)character;
- (NSArray *)getModels;

@end