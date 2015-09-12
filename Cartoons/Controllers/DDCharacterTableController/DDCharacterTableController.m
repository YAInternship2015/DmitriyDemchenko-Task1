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

@interface DDCharacterTableController () <DDModelsDataSourceDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) DDDataSource *dataSource;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end


@implementation DDCharacterTableController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DDDataSource alloc] init];
    self.fetchedResultsController = [self.dataSource getFetchedResultsController];
    self.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fetchedResultsController.fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterTableCell *cell = (DDCharacterTableCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class])];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DDCharacterTableCell class]) owner:nil options:nil];
        cell = nib[0];
    }
    [cell configWithCartoons:self.fetchedResultsController.fetchedObjects[indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
#warning Удаление не работает
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.managedObjectContext deleteObject:self.fetchedResultsController.fetchedObjects[indexPath.row]];
        
        NSError *error = nil;
        if(![self.managedObjectContext save:&error]){
            NSLog(@"Can't delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
    }
}

#pragma mark - DDModelsDataSourceDelegate

- (void)dataWasChanged:(DDDataSource *)dataSource {
    [self.tableView reloadData];
}

@end