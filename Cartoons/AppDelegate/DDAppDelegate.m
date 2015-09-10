//
//  DDAppDelegate.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAppDelegate.h"
#import "DDDataManager.h"
#import "DDMigrateManager.h"

@interface DDAppDelegate ()

@end


@implementation DDAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DDDataManager copyCharactersPlistToAppDocumentsFolder];
//    [DDMigrateManager migrateContentFromPlistToCoreData];
    
    
//#warning настройку Appearance лучше вынести в какой-нибудь AppearanceConfigurator
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