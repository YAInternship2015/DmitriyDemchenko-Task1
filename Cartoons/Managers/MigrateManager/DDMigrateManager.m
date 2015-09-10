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
    
    NSError *error = nil;
    BOOL isEmpty;
    NSManagedObjectContext *managedObjectContext = [[DDCoreDataManager sharedManager] managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:EntityCharacter inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    [request setFetchLimit:1];
    
    isEmpty = ([managedObjectContext countForFetchRequest:request error:&error] == 0) ? YES : NO;
    
    if (isEmpty) {
        NSArray *tempArray = [[NSArray alloc] init];
        tempArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType]];
        for (NSDictionary *model in tempArray) {
            DDCharacter *addItem = [NSEntityDescription insertNewObjectForEntityForName:EntityCharacter inManagedObjectContext:managedObjectContext];
            
            addItem.name = model[kName];
            addItem.imageName = model[kImageName];
            
            NSError *error = nil;
            if (![managedObjectContext save:&error]) {
                NSLog(@"%@", [NSString stringWithFormat:@"%@, %@", error, [error description]]);
            }
        }
    }
}
/*

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