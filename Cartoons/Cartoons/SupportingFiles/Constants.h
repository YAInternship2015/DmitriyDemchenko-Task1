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


#pragma mark - DataSource keys

static NSString *const kName = @"name";
static NSString *const kImageName = @"imageName";

static NSString *const NoImage = @"NoImage";


#pragma mark - Stroryboard IDs

static NSString *const TableControllerID = @"DDCharacterTableController";
static NSString *const CollectionControllerID = @"DDCharacterCollectionController";


#pragma mark - Notifications

static NSString *const NotificationDataFileContentDidChange = @"Notification";

#endif