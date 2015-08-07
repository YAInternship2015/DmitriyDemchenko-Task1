//
//  DDCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.f && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.f)
#define IOS8_AND_LETER ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)

#import "DDCharacterController.h"
#import "DDCharacterCell.h"
#import "DDCharactersModel.h"

@interface DDCharacterController ()

@property (strong, nonatomic) NSArray *dataSourceArray;

@end


@implementation DDCharacterController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.f, 0.f, 0.f, 0.f);
    
    DDCharactersModel *items = [[DDCharactersModel alloc] init];
    self.dataSourceArray = items.cartoonCharacters;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDCharacterCell *cell = [tableView dequeueReusableCellWithIdentifier:[DDCharacterCell reuseIdentifier]];
    
    if (!cell) {
        cell = [DDCharacterCell initCharacterCell];
    }
    
    [cell configForItem:self.dataSourceArray[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (IOS8_AND_LETER) {
        cell.preservesSuperviewLayoutMargins = NO;
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    // iOS 7 and later
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
        [cell setSeparatorInset:UIEdgeInsetsZero];
}

@end