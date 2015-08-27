//
//  DDAppDelegate.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAppDelegate.h"
#import "DDDataManager.h"

@interface DDAppDelegate ()

@end


@implementation DDAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DDDataManager copyCharactersPlistToAppDocumentsFolder];
    
    [[UINavigationBar appearance] setBarTintColor:[DDSerialConstructor appYellowColor]];
    [[UINavigationBar appearance] setTintColor:[DDSerialConstructor appPurpleColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [DDSerialConstructor appPurpleColor]}];
    
    [[UITextField appearance] setTintColor:[DDSerialConstructor appPurpleColor]];
    
    return YES;
}

@end