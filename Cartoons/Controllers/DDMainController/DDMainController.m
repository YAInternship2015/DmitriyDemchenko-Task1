//
//  DDMainController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDMainController.h"
#import "DDContainerViewController.h"

@interface DDMainController ()

@property (nonatomic, strong) DDContainerViewController *containerViewController;

@end


static NSString *const EmbedContainer = @"EmbedContainer";


@implementation DDMainController

#pragma mark - UIViewController methods

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:EmbedContainer]) {
        self.containerViewController = segue.destinationViewController;
    }
}

#pragma mark - IBActions

- (IBAction)changeView:(id)sender {
    [self.containerViewController swapViewControllers:self.navigationItem];
}

@end