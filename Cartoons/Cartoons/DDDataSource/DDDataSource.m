//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"
#import "DDCharacterFactory.h"
#import "NSString+MainBundle.h"

@interface DDDataSource ()

@property (strong, nonatomic) NSArray *charactersArray;

@end


@implementation DDDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadArrayWithPlist];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadArrayWithPlist) name:NotificationDataFileContentDidChange object:nil];
    }
    return self;
}

/*
- (instancetype)initWithDelegate:(id<DDDataSourceDelegate>)delegate
{
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    NSLog(@"APMusicInstrumentsDataSource init");
    return self;
}
*/

- (NSArray *)getModels {
    return _charactersArray;
}

- (void)loadArrayWithPlist {
    
    NSString *str = [NSString dataSourcePath];
    _charactersArray = [NSArray arrayWithContentsOfFile:[NSString dataSourcePath]];
//    [self.delegate dataSourceIsUpdated];
}

- (void)copyInstrumentPlistToMainBundle {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSString dataSourcePath];
    BOOL fileExists = [fileManager fileExistsAtPath: docPath];
    NSError *error = nil;
    if(fileExists) {
        [fileManager removeItemAtPath:docPath error:&error];
    }
    NSString *strSourcePath = [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"];
    [fileManager copyItemAtPath:strSourcePath toPath:docPath error:&error];
//    [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotification object:nil];
}


+ (void)addCharacter:(DDCharacterFactory *)character {
    
    NSDictionary *newModel = @{kName : character.name,
                               kImageName : NoImage};
    
    NSMutableArray *tempModelsArray = [NSMutableArray arrayWithContentsOfFile:[NSString dataSourcePath]];
    [tempModelsArray addObject:newModel];
    
    if ([tempModelsArray writeToFile:[NSString dataSourcePath] atomically:YES]) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationDataFileContentDidChange object:nil];
        [DDSerialConstructor showAlertWithTitle:@"Alert" message:@"Character added." delegate:self];
    } else {
        [DDSerialConstructor showAlertWithTitle:@"Alert" message:@"Character not added." delegate:self];
    }
//    ;
    
    NSLog(@"%@", [NSArray arrayWithContentsOfFile:[NSString dataSourcePath]]);
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end