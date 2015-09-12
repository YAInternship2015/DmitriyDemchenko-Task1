//
//  DDCharacterCollectionController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/22/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterCollectionController.h"
#import "DDCharacterCollectionCell.h"
#import "DDDataSource.h"

@interface DDCharacterCollectionController () <DDModelsDataSourceDelegate>

@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgr;
@property (nonatomic, strong) DDDataSource *dataSource;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) NSMutableArray *items;

@end


@implementation DDCharacterCollectionController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DDDataSource alloc] initWithDelegate:self];
    self.fetchedResultsController = [self.dataSource getFetchedResultsController];
    self.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
    [self.lpgr addTarget:self action:@selector(handleLongPress:)];
    self.lpgr.minimumPressDuration = 1.f;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [self.fetchedResultsController.fetchedObjects count];
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterCollectionCell *cell = (DDCharacterCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DDCharacterCollectionCell class]) forIndexPath:indexPath];
//    [cell configWithCartoons:self.fetchedResultsController.fetchedObjects[indexPath.row]];
    [cell configWithCartoons:self.items[indexPath.row]];
    
    return cell;
}

#pragma mark UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat mainScreen = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat cellSize = (mainScreen / 100 < 4) ? (mainScreen - 20.f) / 3 : (mainScreen - 25.f) / 4;
    return CGSizeMake(cellSize, cellSize);
}

#pragma mark - DDModelsDataSourceDelegate

- (void)dataWasChanged:(DDDataSource *)dataSource {
    self.items = [[NSMutableArray alloc] initWithArray:[DDCharacter MR_findAll]];
    [self.collectionView reloadData];
}

#pragma mark - Private methods

-(void)handleLongPress:(UILongPressGestureRecognizer *)lpgr {
    if (lpgr.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [lpgr locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        [self.items removeObjectAtIndex:indexPath.row];
        [self.collectionView performBatchUpdates: ^{
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
            DDCharacter *item = [self.fetchedResultsController objectAtIndexPath:indexPath];
            [item MR_deleteEntity];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        } completion:nil];
    }
}

@end