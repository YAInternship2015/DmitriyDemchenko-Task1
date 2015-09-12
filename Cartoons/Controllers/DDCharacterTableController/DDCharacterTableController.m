//
//  DDCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterTableController.h"
#import "DDCharacterTableCell.h"
#import "DDDataSource.h"

@interface DDCharacterTableController () <DDModelsDataSourceDelegate>

@property (nonatomic, strong) DDDataSource *dataSource;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) NSMutableArray *charactersArray;

@end


@implementation DDCharacterTableController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DDDataSource alloc] initWithDelegate:self];
    self.fetchedResultsController = [self.dataSource getFetchedResultsController];
    self.charactersArray = [[NSMutableArray alloc] initWithArray:[DDCharacter MR_findAll]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.charactersArray count];
//    return [self.fetchedResultsController.fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterTableCell *cell = (DDCharacterTableCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class])];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DDCharacterTableCell class]) owner:nil options:nil];
        cell = nib[0];
    }
//    [cell configWithCartoons:self.fetchedResultsController.fetchedObjects[indexPath.row]];
    [cell configWithCartoons:self.charactersArray[indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        DDCharacter *characterToRemove = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [characterToRemove MR_deleteEntity];
        [self.charactersArray removeObjectAtIndex:indexPath.row];
        [self.tableView endUpdates];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

#pragma mark - DDModelsDataSourceDelegate

- (void)dataWasChanged:(DDDataSource *)dataSource {
    self.charactersArray = [[NSMutableArray alloc] initWithArray:[DDCharacter MR_findAll]];
    [self.tableView reloadData];
}

@end