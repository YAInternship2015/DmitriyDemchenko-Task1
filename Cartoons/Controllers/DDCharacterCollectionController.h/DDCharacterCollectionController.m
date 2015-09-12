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

@property (nonatomic, strong) IBOutlet UILongPressGestureRecognizer *lpgr;
@property (nonatomic, strong) DDDataSource *dataSource;

@end


@implementation DDCharacterCollectionController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DDDataSource alloc] initWithDelegate:self];
    [self.lpgr addTarget:self action:@selector(handleLongPress:)];
    self.lpgr.minimumPressDuration = 1.f;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [self.fetchedResultsController.fetchedObjects count];
    return [self.dataSource countModels];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterCollectionCell *cell = (DDCharacterCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DDCharacterCollectionCell class]) forIndexPath:indexPath];
    [cell configWithCartoons:[self.dataSource modelForIndex:indexPath.row]];
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
    [self.collectionView reloadData];
}

#pragma mark - Private methods

-(void)handleLongPress:(UILongPressGestureRecognizer *)lpgr {
    if (lpgr.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [lpgr locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        [self.collectionView performBatchUpdates: ^{
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
            [self.dataSource removeModelAtIndex:indexPath];
        } completion:nil];
    }
}

@end