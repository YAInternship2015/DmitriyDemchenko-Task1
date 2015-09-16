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

//#warning не стоит сокращать имя свойства до lpgr, в obj-c не экономят на длине селекторов :)
//@property (nonatomic, strong) IBOutlet UILongPressGestureRecognizer *lpgr;
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
//#warning селектор можно было задать в сториборде
//    [self.lpgr addTarget:self action:@selector(handleLongPress:)];
//    self.lpgr.minimumPressDuration = 1.f;
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
    // setup sizes of cell: if (iPhone6+) ? 4 columns : 3 columns
//#warning цифры нужно объявить константами
    CGFloat widthOfScreen = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    CGFloat widthOfCellForIPhone6Plus = (widthOfScreen - (CellSpasing * (NumberOfColumnsForIPhone6Plus + 1))) / NumberOfColumnsForIPhone6Plus;
    CGFloat widthOfCellForIPhone4ToIPhone6 = (widthOfScreen - (CellSpasing * (NumberOfColumnsForIPhone4ToIPhone6 + 1))) / NumberOfColumnsForIPhone4ToIPhone6;
    
    CGFloat widthOfCell = IS_IPHONE_6_PLUS ? widthOfCellForIPhone6Plus : widthOfCellForIPhone4ToIPhone6;
    
//    CGFloat widthOfCell = (widthOfScreen / 100 < 4) ? widthOfCellForIPhone4ToIPhone6 : widthOfCellForIPhone6Plus;
    // height of cell = widthOfCell
    return CGSizeMake(widthOfCell, widthOfCell);
}

#pragma mark - DDModelsDataSourceDelegate
/*
- (void)dataWasChanged:(DDDataSource *)dataSource {
    [self.collectionView reloadData];
}
*/

- (void)contentWasChangedAtIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    [self.collectionView reloadData];
}

#pragma mark - Private methods

/*
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
#warning удаление в collectionView делать не нужно, вы только удаляете модель, и далее через NSFetchedResultsController изменения отображаются в UI
                [weakSelf.collectionView deleteItemsAtIndexPaths:@[indexPath]];
                [weakSelf.dataSource removeModelAtIndex:indexPath];
            } completion:nil];
        }];
    }
}
*/
 
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
//#warning удаление в collectionView делать не нужно, вы только удаляете модель, и далее через NSFetchedResultsController изменения отображаются в UI
//                [weakSelf.collectionView deleteItemsAtIndexPaths:@[indexPath]];
                [weakSelf.dataSource removeModelAtIndex:indexPath];
            } completion:nil];
        }];
    }
}

@end