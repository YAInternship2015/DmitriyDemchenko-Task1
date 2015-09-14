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
    return [self.dataSource countModels];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterCollectionCell *cell = (DDCharacterCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DDCharacterCollectionCell class]) forIndexPath:indexPath];
    [cell configWithCartoons:[self.dataSource modelForIndex:indexPath.row]];
    return cell;
}

#pragma mark    

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DDAddCharacterController *controller = (DDAddCharacterController *)[self.storyboard instantiateViewControllerWithIdentifier:AddCharacterControllerID];
    controller.editModel = [self.dataSource modelForIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // setup sizes of cell: if (iPhone6+) ? 4 columns : 3 columns
    CGFloat widthOfScreen = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat widthOfCell = (widthOfScreen / 100 < 4) ? (widthOfScreen - 20.f) / 3 : (widthOfScreen - 25.f) / 4;
    // height of cell = widthOfCell
    return CGSizeMake(widthOfCell, widthOfCell);
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
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.3f animations:^{
            UICollectionViewCell *cell = [weakSelf.collectionView cellForItemAtIndexPath:indexPath];
            cell.layer.transform = CATransform3DMakeRotation(M_PI,1.0,0.0,0.0);;
        } completion:^(BOOL finished) {
            [weakSelf.collectionView performBatchUpdates:^{
                [weakSelf.collectionView deleteItemsAtIndexPaths:@[indexPath]];
                [weakSelf.dataSource removeModelAtIndex:indexPath];
            } completion:nil];
        }];
    }
}

@end