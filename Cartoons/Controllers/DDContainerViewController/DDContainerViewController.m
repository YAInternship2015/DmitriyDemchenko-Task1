//
//  DDContainerViewController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDContainerViewController.h"
#import "DDCharacterTableController.h"
#import "DDCharacterCollectionController.h"
#import "DDAddCharacterController.h"

@interface DDContainerViewController ()

@property (nonatomic, strong) DDCharacterTableController *tableController;
@property (nonatomic, strong) DDCharacterCollectionController *collectionController;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, assign) BOOL isChangeViewController;

@end


static CGFloat const AnimateDuration = 1.3f;

@implementation DDContainerViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isChangeViewController = NO;
    
    self.tableController = [self.storyboard instantiateViewControllerWithIdentifier:TableControllerID];
    self.collectionController = [self.storyboard instantiateViewControllerWithIdentifier:CollectionControllerID];
    
    [self presentController:self.tableController];
}

#pragma mark - ContainerViewController methods

- (void)presentController:(UIViewController *)controller {
    if (self.currentViewController) {
        [self removeCurrentViewController];
    }
    [self addChildViewController:controller];
    controller.view.frame = [self frameForCharacterController];
    [self.view addSubview:controller.view];
    self.currentViewController = controller;
    [controller didMoveToParentViewController:self];
}

- (void)removeCurrentViewController {
    [self.currentViewController willMoveToParentViewController:nil];
    [self.currentViewController.view removeFromSuperview];
    [self.currentViewController removeFromParentViewController];
}

- (void)swapCurrentControllerWith:(UIViewController *)controller {
    
    __block CGRect tempRect;
    tempRect.origin.x = 0.f;
    tempRect.origin.y = CGRectGetHeight([UIScreen mainScreen].bounds) * 2;
    tempRect.size = CGSizeMake(CGRectGetWidth(controller.view.frame), CGRectGetHeight(controller.view.frame));
    
    [self.currentViewController willMoveToParentViewController:nil];
    [self addChildViewController:controller];
    controller.view.frame = tempRect;
    [self.view addSubview:controller.view];
    
    [UIView animateWithDuration:AnimateDuration animations:^{
        
        controller.view.frame = self.currentViewController.view.frame;
        tempRect.origin.y = -(CGRectGetHeight([UIScreen mainScreen].bounds) * 2);
        self.currentViewController.view.frame = tempRect;
        
    } completion:^(BOOL finished) {
        
        [self.currentViewController.view removeFromSuperview];
        [self.currentViewController removeFromParentViewController];
        self.currentViewController = controller;
        [self.currentViewController didMoveToParentViewController:self];
    }];
}

- (CGRect)frameForCharacterController {
    return self.view.bounds;
}

#pragma mark - Actions

- (void)swapViewControllers:(UINavigationItem *)navigationItem {
    if (!self.isChangeViewController) {
        [self swapCurrentControllerWith:self.collectionController];
        [navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"TableViewIcon"]];
        self.isChangeViewController = YES;
    } else {
        [self swapCurrentControllerWith:self.tableController];
        [navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"CollectionViewIcon"]];
        self.isChangeViewController = NO;
    }
}

@end