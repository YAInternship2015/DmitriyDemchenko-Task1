//
//  DDAppearanceConfigurator.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 9/15/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAppearanceConfigurator.h"

@implementation DDAppearanceConfigurator

//#warning Этот код следует вынести в отдельный класс, вроде AppearanceConfigurator

+ (void)configurateNavigationBar {
    [[UINavigationBar appearance] setBarTintColor:[UIColor appYellowColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor appPurpleColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor appPurpleColor]}];
}

+ (void)configurateTextField {
    [[UITextField appearance] setTintColor:[UIColor appPurpleColor]];
}

@end