//
//  UIViewController+Container.h
//  
//
//  Created by Chen YU on 26/6/15.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (Container)

- (void)addAndDisplayChildViewController:(UIViewController *)childViewController inView:(UIView *)view;
- (void)addAndDisplayChildViewController:(UIViewController *)childViewController withFrame:(CGRect)frame inView:(UIView *)view;
- (void)addAndDisplayChildViewController:(UIViewController *)childViewController;
- (void)addAndDisplayChildViewController:(UIViewController *)childViewController withFrame:(CGRect)frame;
- (void)removeChildViewControllerFromSelf:(UIViewController *)childViewController;
- (void)removeSelfFromParentViewController;

@end
