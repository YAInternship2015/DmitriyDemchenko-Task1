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

@interface DDCharacterTableController ()

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation DDCharacterTableController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    DDDataSource *characters = [[DDDataSource alloc] init];
    self.dataSource = [characters getModels];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCharacterTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class])];
    if (!cell) {
        cell = [DDCharacterTableCell initCharacterTableCell];
    }
    [cell configWithCartoons:self.dataSource[indexPath.row]];
    return cell;
}

@end