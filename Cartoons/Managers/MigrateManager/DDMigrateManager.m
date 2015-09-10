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


+ (void)migrateContentFromPlistToCoreData {
    
    BOOL isEmpty;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:EntityCharacter inManagedObjectContext:[[DDCoreDataManager sharedManager] managedObjectContext]];
    [request setEntity:entity];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *results = [[[DDCoreDataManager sharedManager] managedObjectContext] executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Fetch error: %@", error);
        abort();
    }
    if ([results count] == 0) {
        isEmpty = NO;
    }
    isEmpty = YES;
    
    if (isEmpty) {
        NSArray *tempArray = [[NSArray alloc] init];
        tempArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType]];
        for (NSDictionary *model in tempArray) {
            DDCharacter *addItem = [NSEntityDescription insertNewObjectForEntityForName:EntityCharacter inManagedObjectContext:[[DDCoreDataManager sharedManager] managedObjectContext]];
            
            addItem.name = model[kName];
            addItem.imageName = model[kImageName];
            
            NSError *error = nil;
            if (![[[DDCoreDataManager sharedManager] managedObjectContext] save:&error]) {
                NSLog(@"%@", [NSString stringWithFormat:@"%@, %@", error, [error description]]);
            }
        }
    }
}
/*
- (NSString *)resourcesFolderPath {
    return [[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType];
}

- (BOOL)coreDataHasEntriesForEntityName:(NSString *)entityName {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[[DDCoreDataManager sharedManager] managedObjectContext]];
    [request setEntity:entity];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *results = [[[DDCoreDataManager sharedManager] managedObjectContext] executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Fetch error: %@", error);
        abort();
    }
    if ([results count] == 0) {
        return NO;
    }
    return YES;
}
*/
@end