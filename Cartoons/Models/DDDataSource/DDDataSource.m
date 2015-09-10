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
    
    [self showData];
#warning Сделать метод для получения массива из DataManager
    self.charactersArray = [NSArray arrayWithContentsOfFile:[NSString documentsFolderPath]];
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
// ---------------------------------------------------------------------------------------------



- (NSArray *)showData {
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    NSManagedObjectContext *managedObjectContext = [[DDCoreDataManager sharedManager] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:EntityCharacter];
    itemsArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    for (int i = 0; i < itemsArray.count; i++) {
        DDCharacter *ch = itemsArray[i];
        NSLog(@"%@", ch.name);
    }
    
    return itemsArray;
}

@end