//
//  DDAppDelegate.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAppDelegate.h"
#import "DDAppearanceConfigurator.h"
#import "DDMigrateManager.h"

@implementation DDAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:EntityCharacter];
    [DDMigrateManager migrateContentFromPlistToCoreDataIfNeeded];
    
    [DDAppearanceConfigurator configurateNavigationBar];
    [DDAppearanceConfigurator configurateTextField];
    
    return YES;
}

@end