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

- (NSUInteger)countModels;
- (DDCharacter *)modelForIndex:(NSInteger)index;
- (void)removeModelAtIndex:(NSIndexPath *)indexPath;

@end


@protocol DDModelsDataSourceDelegate <NSObject>

#warning чтобы появились анимации при изменении данных в базе, делегат необходимо изменить так, чтобы контроллер понимал, какое изменение происходит и что собственно необходимо анимировать. reloadData теперь недостаточно 
@required
- (void)dataWasChanged:(DDDataSource *)dataSource;

@end