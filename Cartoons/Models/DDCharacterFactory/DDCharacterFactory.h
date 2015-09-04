//
//  DDCreateCharacter.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCharacterFactory : NSObject

//#warning не понял, зачем у фабрики есть эти свойства
//@property (strong, nonatomic) NSString *name;
//@property (strong, nonatomic) NSString *imageName;

+ (NSDictionary *)modelWithName:(NSString *)name;

@end