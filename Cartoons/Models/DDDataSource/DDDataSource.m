//
//  DDDataSource.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/11/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDDataSource.h"
#import "DDCharacterFactory.h"
#import "NSString+ResourcePath.h"

@interface DDDataSource ()

//#warning (nonatomic, strong)
@property (nonatomic, strong) NSArray *charactersArray;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end


@implementation DDDataSource

#pragma mark - Lifecycle

- (instancetype)initWithDelegate:(id<DDModelsDataSourceDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadArrayWithPlist) name:NotificationDataFileContentDidChange object:nil];
        [self loadArrayWithPlist];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - DataSource methods

- (void)loadArrayWithPlist {
    _charactersArray = [NSArray arrayWithContentsOfFile:[NSString documentsFolderPath]];
    [self copyDataFromPlistToCoreData];
    [self.delegate dataWasChanged:self];
}

- (NSUInteger)countModels {
    return [self.charactersArray count];
}

- (NSDictionary *)modelForIndex:(NSInteger)index {
    return self.charactersArray[index];
}

- (void)reloadArrayWithPlist {
    [self loadArrayWithPlist];
}

- (void)copyDataFromPlistToCoreData {
    
    self.managedObjectContext = [[DDCoreDataManager sharedManager] managedObjectContext];
    
    NSArray *tempArray = [NSArray arrayWithContentsOfFile:[NSString resourcesFolderPath]];
    
    for (NSDictionary *dict in tempArray) {
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", dict[kName]];
        NSEntityDescription *entity = [NSEntityDescription entityForName:EntityCharacter inManagedObjectContext:self.managedObjectContext];
        [request setEntity:entity];
        [request setPredicate:predicate];
        
        NSError *error;
        NSArray *result = [self.managedObjectContext executeFetchRequest:request error:&error];
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
        DDCharacter *addCharacter = nil;
        if ([result count]) {
            addCharacter = result[0];
        } else {
            addCharacter = [NSEntityDescription insertNewObjectForEntityForName:EntityCharacter inManagedObjectContext:self.managedObjectContext];
        }
        
        addCharacter.name = dict[kName];
        addCharacter.imageName = dict[kImageName];
    }
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        [UIAlertView showAlertWithMessage:[NSString stringWithFormat:@"%@, %@", error, [error description]]];
    }
}

@end