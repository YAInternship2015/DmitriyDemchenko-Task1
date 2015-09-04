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

    if (![fileManager fileExistsAtPath:documentsPath]) {
        [fileManager copyItemAtPath:resourcesPath toPath:documentsPath error:&error];
    }
}

+ (void)addCharacter:(NSDictionary *)character {
//#warning конвертирование модели в NSDictionary лучше инкапсулировать в самой модели, добавив ей метод - (NSDictionary *)dictionaryRepresentation
    NSMutableArray *tempModelsArray = [NSMutableArray arrayWithContentsOfFile:[NSString documentsFolderPath]];
    [tempModelsArray addObject:character];
    
    if ([tempModelsArray writeToFile:[NSString documentsFolderPath] atomically:YES]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationDataFileContentDidChange object:nil];
        [UIAlertView showAlertWithMessage:NSLocalizedString(@"Character added", nil)];
    } else {
        NSLog(@"Character not added");
    }
}

@end