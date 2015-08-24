//
//  DDCharacterCell.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterTableCell.h"

@interface DDCharacterTableCell()

@property (weak, nonatomic) IBOutlet UIImageView *characterImame;
@property (weak, nonatomic) IBOutlet UILabel *characterName;

@end


@implementation DDCharacterTableCell

+ (instancetype)initCharacterTableCell {
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return nibObjects[0];
}

- (void)configWithCartoons:(NSDictionary *)model {
    self.characterName.text = model[kName];
    self.characterImame.image = [UIImage imageNamed:model[kImageName]];
}

@end