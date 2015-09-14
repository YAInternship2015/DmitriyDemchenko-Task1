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
#import "DDAddCharacterController.h"

@interface DDCharacterTableController () <DDModelsDataSourceDelegate>

@property (nonatomic, strong) DDDataSource *dataSource;

@end


@implementation DDCharacterTableController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DDDataSource alloc] initWithDelegate:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource countModels];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterTableCell *cell = (DDCharacterTableCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class])];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DDCharacterTableCell class]) owner:nil options:nil];
        cell = nib[0];
    }
    [cell configWithCartoons:[self.dataSource modelForIndex:indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
#warning Анимация работает только с последней ячейкой ((
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.dataSource removeModelAtIndex:indexPath];
        [tableView endUpdates];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DDAddCharacterController *controller = (DDAddCharacterController *)[self.storyboard instantiateViewControllerWithIdentifier:AddCharacterControllerID];
    controller.editModel = [self.dataSource modelForIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - DDModelsDataSourceDelegate

- (void)dataWasChanged:(DDDataSource *)dataSource {
    [self.tableView reloadData];
}

@end