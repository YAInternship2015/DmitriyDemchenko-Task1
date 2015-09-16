//
//  MigrateManager.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 9/10/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDMigrateManager.h"
#import "DDCharacter.h"

@implementation DDMigrateManager


static NSString *const ResourceName = @"Characters";
static NSString *const ResourceType = @"plist";

+ (void)migrateContentFromPlistToCoreDataIfNeeded {
    if (![DDCharacter MR_countOfEntities]) {
        NSArray *tempArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType]];
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
            [tempArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                DDCharacter *addItem = [DDCharacter MR_createEntityInContext:localContext];
                addItem.name = obj[kName];
                addItem.imageName = obj[kImageName];
            }];
        }];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

@end