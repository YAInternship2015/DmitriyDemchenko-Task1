//
//  DDCharacterCell.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDCharacterTableCell : UITableViewCell

//+ (instancetype)initCharacterTableCell;
- (void)configWithCartoons:(NSDictionary *)model;

@end