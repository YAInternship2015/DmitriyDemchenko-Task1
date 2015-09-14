//
//  MigrateManager.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 9/10/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDMigrateManager : NSObject

+ (void)migrateContentFromPlistToCoreData;

@end