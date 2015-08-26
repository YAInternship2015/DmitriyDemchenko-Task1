//
//  DDDataManager.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataManager.h"
#import "DDCharacterFactory.h"
#import "NSString+ResourcePath.h"

@implementation DDDataManager

+ (void)copyCharactersPlistToAppDocumentsFolder {
    
    NSString *documentsPath = [NSString documentsFolderPath];
    NSString *resourcesPath = [NSString resourcesFolderPath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;

    if ([fileManager fileExistsAtPath:documentsPath] == NO) {
        [fileManager copyItemAtPath:resourcesPath toPath:documentsPath error:&error];
    }
    
    /*
    if ([fileManager fileExistsAtPath:documentsPath] == YES) {
        [fileManager removeItemAtPath:documentsPath error:&error];
    }
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"];
    [fileManager copyItemAtPath:resourcePath toPath:documentsPath error:&error];
    */
}

+ (void)addCharacter:(DDCharacterFactory *)character {
    
    NSDictionary *newModel = @{kName : character.name,
                               kImageName : NoImage};
    
    NSMutableArray *tempModelsArray = [NSMutableArray arrayWithContentsOfFile:[NSString documentsFolderPath]];
    [tempModelsArray addObject:newModel];
    
    if ([tempModelsArray writeToFile:[NSString documentsFolderPath] atomically:YES]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationDataFileContentDidChange object:nil];
//        [DDSerialConstructor showAlertWithTitle:@"Alert" message:@"Character added." delegate:self];
    } else {
//        [DDSerialConstructor showAlertWithTitle:@"Alert" message:@"Character not added." delegate:self];
    }
}

@end