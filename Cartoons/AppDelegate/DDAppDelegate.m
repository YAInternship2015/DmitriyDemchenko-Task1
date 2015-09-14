//
//  DDAppDelegate.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAppDelegate.h"
#import "DDMigrateManager.h"

@implementation DDAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithStoreNamed:EntityCharacter];
    [DDMigrateManager migrateContentFromPlistToCoreData];
    [self appearanceConfigurator];
    return YES;
}

- (void)appearanceConfigurator {
    [[UINavigationBar appearance] setBarTintColor:[UIColor appYellowColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor appPurpleColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor appPurpleColor]}];
    [[UITextField appearance] setTintColor:[UIColor appPurpleColor]];
}

@end