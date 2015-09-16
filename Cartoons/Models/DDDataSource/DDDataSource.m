//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"

@interface DDDataSource () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end


@implementation DDDataSource

#pragma mark - Lifecycle

- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        [self setupFetchedResultsController];
    }
    return self;
}

#pragma mark - DataSource methods

- (void)setupFetchedResultsController {
    self.fetchedResultsController = [DDCharacter MR_fetchAllSortedBy:kName ascending:YES withPredicate:nil groupBy:nil delegate:self];
}

- (NSUInteger)numberOfModels {
    return [DDCharacter MR_countOfEntities];
}

- (DDCharacter *)modelForIndex:(NSInteger)index {
    return self.fetchedResultsController.fetchedObjects[index];
}

- (void)removeModelAtIndex:(NSIndexPath *)indexPath {
    DDCharacter *characterToRemove = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [characterToRemove MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self setupFetchedResultsController];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    [self.delegate contentWasChangedAtIndexPath:indexPath forChangeType:type newIndexPath:newIndexPath];
}

@end