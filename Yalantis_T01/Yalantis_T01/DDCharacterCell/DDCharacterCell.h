//
//  DDCharacterCell.h
//  Yalantis_T01
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDCharacterCell : UITableViewCell

+ (instancetype)initCharacterCell;
+ (NSString *)reuseIdentifier;
- (void)configForItem:(id)item;

@end
