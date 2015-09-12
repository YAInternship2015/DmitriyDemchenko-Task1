//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"

@interface DDDataSource () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end


@implementation DDDataSource

#pragma mark - Lifecycle

- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
        [self loadContentWithCoreData];
    }
    return self;
}

#pragma mark - DataSource methods

- (NSFetchedResultsController *)getFetchedResultsController {
    return self.fetchedResultsController;
}

- (void)loadContentWithCoreData {
    self.fetchedResultsController = [DDCharacter MR_fetchAllSortedBy:kName ascending:YES withPredicate:nil groupBy:nil delegate:self];
    [self.delegate dataWasChanged:self];
}


#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self loadContentWithCoreData];
}

@end