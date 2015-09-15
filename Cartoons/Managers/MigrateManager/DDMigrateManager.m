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

//#warning так как здесь не всегда происходит копирование данных из plist, это стоит отразить в имени метода. migrateContentFromPlistToCoreDataIfNeeded
+ (void)migrateContentFromPlistToCoreDataIfNeeded {
    if (![DDCharacter MR_countOfEntities]) {
//#warning используя MagicalRecord созранение можно сделать немного по-другому, более потокобезопасно
        NSArray *tempArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType]];
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
            [tempArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                DDCharacter *addItem = [DDCharacter MR_createEntityInContext:localContext];
                addItem.name = obj[kName];
                addItem.imageName = obj[kImageName];
            }];
        }];
        /*
        NSArray *tempArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:ResourceName ofType:ResourceType]];
        [tempArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            DDCharacter *addItem = [DDCharacter MR_createEntity];
            addItem.name = obj[kName];
            addItem.imageName = obj[kImageName];

        }];
         */
//#warning нет необходимости сохранять контекст на каждой итерации, достаточно сделать один save после цикла
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

@end