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
    /*
    DDCharacterTableCell *cell = (DDCharacterTableCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class])];
    */
//#warning if не будет нужен, если использовать метод - (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
    
    /*
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DDCharacterTableCell class]) owner:nil options:nil];
        cell = nib[0];
    }*/
    
    DDCharacterTableCell *cell = (DDCharacterTableCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([DDCharacterTableCell class]) forIndexPath:indexPath];
    
    [cell configWithCartoons:[self.dataSource modelForIndex:indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
#warning Анимация работает только с последней ячейкой ((
#warning анимация не работает, так как при удалении модели из базы NSFetchedResultsController в датасорсе реагирует на это изменение, и вызывается метод dataWasChanged:, где в свою очередь вызывается reloadData у таблицы. Этот последний вызов перекрывает собой анимацию. В методе удаления вы не должны анимировать удаление. Анимировать Вы должны те изменения, которые детектит NSFetchedResultsController в своем делегате
        [tableView beginUpdates];
        [self.dataSource removeModelAtIndex:indexPath];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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