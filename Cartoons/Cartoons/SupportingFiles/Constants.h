//
//  Constants.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/21/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef CARTOONS_Constants_h
#define CARTOONS_Constants_h

//#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] != NSOrderedAscending)
//#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
//#define IOS8_AND_LETER ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)
//
//static float const DefaultFeedCellHeight = 350.f;
//
//static NSString *const LoginStoryboardName = @"Login";
//static NSString *const MainStoryboardName = @"Main";
//
//static NSString *const ErrorDeskriptionKey = @"Description";
//
//static float const FourInchDisplayHeight = 568.f;
//
//
//static NSUInteger MaxFeedBodyTextLength = 3000;

#pragma mark - DataSource keys

static NSString *const kName = @"name";
static NSString *const kImageName = @"imageName";

static NSString *const NoImage = @"NoImage";


#pragma mark - Stroryboard IDs

static NSString *const TableControllerID = @"DDCharacterTableController";
static NSString *const CollectionControllerID = @"DDCharacterCollectionController";

#endif
