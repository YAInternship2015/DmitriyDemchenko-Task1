//
//  DDCharacterCell.m
//  Yalantis_T01
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterCell.h"

@interface DDCharacterCell()

@property (weak, nonatomic) IBOutlet UIImageView *characterImame;
@property (weak, nonatomic) IBOutlet UILabel *characterName;

@end


@implementation DDCharacterCell

+ (instancetype)initCharacterCell
{
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:[self reuseIdentifier] owner:nil options:nil];
    return nibObjects[0];
}

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

- (void)configForItem:(id)item
{
    self.characterName.text = item;
    self.characterImame.image = [UIImage imageNamed:item];
}

@end