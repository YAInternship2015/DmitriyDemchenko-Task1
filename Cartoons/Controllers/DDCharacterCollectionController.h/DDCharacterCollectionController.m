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
#import "DDAddCharacterController.h"

#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

@interface DDCharacterCollectionController () <DDModelsDataSourceDelegate>

@property (nonatomic, strong) DDDataSource *dataSource;

@end

static CGFloat const NumberOfColumnsForIPhone6Plus = 4.f;
static CGFloat const NumberOfColumnsForIPhone4ToIPhone6 = 3.f;
static CGFloat const CellSpasing = 5.f;


@implementation DDCharacterCollectionController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DDDataSource alloc] initWithDelegate:self];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource numberOfModels];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterCollectionCell *cell = (DDCharacterCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DDCharacterCollectionCell class]) forIndexPath:indexPath];
    [cell configWithCartoons:[self.dataSource modelForIndex:indexPath.row]];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DDAddCharacterController *controller = (DDAddCharacterController *)[self.storyboard instantiateViewControllerWithIdentifier:AddCharacterControllerID];
    controller.editModel = [self.dataSource modelForIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
#warning вынести эту магию в UICollectionViewLayout
    // setup sizes of cell: if (iPhone6+) ? 4 columns : 3 columns
    
    CGFloat widthOfScreen = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    CGFloat widthOfCellForIPhone6Plus = (widthOfScreen - (CellSpasing * (NumberOfColumnsForIPhone6Plus + 1))) / NumberOfColumnsForIPhone6Plus;
    
    CGFloat widthOfCellForIPhone4ToIPhone6 = (widthOfScreen - (CellSpasing * (NumberOfColumnsForIPhone4ToIPhone6 + 1))) / NumberOfColumnsForIPhone4ToIPhone6;
    
    CGFloat widthOfCell = IS_IPHONE_6_PLUS ? widthOfCellForIPhone6Plus : widthOfCellForIPhone4ToIPhone6;
    
    return CGSizeMake(widthOfCell, widthOfCell);
}

#pragma mark - DDModelsDataSourceDelegate

- (void)contentWasChangedAtIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    if (type == NSFetchedResultsChangeInsert) {
        [self.collectionView insertItemsAtIndexPaths:@[newIndexPath]];
    } else if (type == NSFetchedResultsChangeDelete) {
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } else {
        [self.collectionView reloadData];
    }
}

#pragma mark - IBactions

- (IBAction)handleLongPressAction:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [sender locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.3f animations:^{
            UICollectionViewCell *cell = [weakSelf.collectionView cellForItemAtIndexPath:indexPath];
            cell.layer.transform = CATransform3DMakeRotation(M_PI,1.0,0.0,0.0);;
        } completion:^(BOOL finished) {
            [weakSelf.collectionView performBatchUpdates:^{
                [weakSelf.dataSource removeModelAtIndex:indexPath];
            } completion:nil];
        }];
    }
}

@end