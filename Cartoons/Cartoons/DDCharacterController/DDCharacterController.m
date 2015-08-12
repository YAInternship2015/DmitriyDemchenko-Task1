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
#import "DDDataSource.h"

@implementation DDCharacterController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#warning проблема заезжания таблицы под UISTatusBar решается на уровне автолэйаута в сториборде. https://developer.apple.com/library/ios/qa/qa1797/_index.html - в примере не таблица, а тулбар, но смысл тот же. Решение с инсетами - костыль
//    self.tableView.contentInset = UIEdgeInsetsMake(20.f, 0.f, 0.f, 0.f);
    
//    DDCartoons *items = [[DDCartoons alloc] init];
// зачем хранить данные, которые и так доступны в датасорсе? они же могут динамически изменяться
//    self.dataSourceArray = items.cartoonCharacters;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[DDDataSource sharedManager] countOfModel:CartoonCharactersModel];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DDCharacterCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterCell class])];

//#warning эта проверка не нужна была бы, если использовать метод - (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath, который всегда возвращает ячейку
    if (!cell) {
        cell = [DDCharacterCell initCharacterCell];
    }
    
    [cell configWithCartoons:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
/*
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
#warning какие-то костыли :) лучше удалите их
    if (IOS8_AND_LETER) {
        cell.preservesSuperviewLayoutMargins = NO;
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    // iOS 7 and later
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
        [cell setSeparatorInset:UIEdgeInsetsZero];
}
*/
@end