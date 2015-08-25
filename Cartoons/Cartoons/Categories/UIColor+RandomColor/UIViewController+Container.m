//
//  UIViewController+Container.m
//  
//
//  Created by Chen YU on 26/6/15.
//
//

#import "UIViewController+Container.h"

@implementation UIViewController (Container)

- (void)addAndDisplayChildViewController:(UIViewController *)childViewController inView:(UIView *)view
{
    [childViewController willMoveToParentViewController:self];
    [self addChildViewController:childViewController];
    [view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)addAndDisplayChildViewController:(UIViewController *)childViewController withFrame:(CGRect)frame inView:(UIView *)view
{
    [childViewController willMoveToParentViewController:self];
    [self addChildViewController:childViewController];
    childViewController.view.frame = frame;
    [view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)addAndDisplayChildViewController:(UIViewController *)childViewController
{
    [childViewController willMoveToParentViewController:self];
    [self addChildViewController:childViewController];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)addAndDisplayChildViewController:(UIViewController *)childViewController withFrame:(CGRect)frame
{
    [childViewController willMoveToParentViewController:self];
    [self addChildViewController:childViewController];
    childViewController.view.frame = frame;
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)removeChildViewControllerFromSelf:(UIViewController *)childViewController
{
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

- (void)removeSelfFromParentViewController
{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}


@end
