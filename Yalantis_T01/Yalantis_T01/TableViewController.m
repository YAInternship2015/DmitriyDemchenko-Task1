//
//  TableViewController.m
//  Yalantis_T01
//
//  Created by Dmitriy Demchenko on 7/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.f && [[[UIDevice currentDevice] systemVersion] floatValue] < 8.f)
#define IOS8_AND_LETER ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSArray *imagesArray;

@end

static NSString *const ReuseIdentifier = @"ReuseCell";

@implementation TableViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.f, 0.f, 0.f, 0.f);
    
    self.imagesArray = @[@"Daisy", @"Donald", @"Goofy", @"Jerry", @"Lion", @"Mickey", @"Minnie", @"Monkey", @"Pluto", @"Tweety"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imagesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
    
    NSString *item = self.imagesArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:item];
    cell.textLabel.text = item;
    
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