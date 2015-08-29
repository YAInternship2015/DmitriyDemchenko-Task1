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
    DDCharacterTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class])];
    if (!cell) {
        cell = [DDCharacterTableCell initCharacterTableCell];
    }
    [cell configWithCartoons:[self.dataSource modelForIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - DDModelsDataSourceDelegate

- (void)dataWasChanged:(DDDataSource *)dataSource {
    [self.tableView reloadData];
}

@end