//
//  DDDataManager.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DDCharacterFactory;

@interface DDDataManager : NSObject

+ (void)copyCharactersPlistToAppDocumentsFolder;
+ (void)addCharacter:(NSDictionary *)character;

@end