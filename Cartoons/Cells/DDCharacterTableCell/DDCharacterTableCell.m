//
//  DDCharacterCell.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterTableCell.h"

@interface DDCharacterTableCell()

@property (nonatomic, weak) IBOutlet UIImageView *characterImame;
@property (nonatomic, weak) IBOutlet UILabel *characterName;

@end


@implementation DDCharacterTableCell

- (void)configWithCartoons:(DDCharacter *)model {
    self.backgroundColor = [UIColor randomColor];
    self.characterName.text = model.name;
    self.characterImame.image = [UIImage imageNamed:model.imageName];
}

@end