//
//  DDCharacterCell.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterCell.h"
#import "DDDataSource.h"

@interface DDCharacterCell()

@property (weak, nonatomic) IBOutlet UIImageView *characterImame;
@property (weak, nonatomic) IBOutlet UILabel *characterName;

@end


@implementation DDCharacterCell

+ (instancetype)initCharacterCell
{
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return nibObjects[0];
}

- (void)configWithCartoons:(NSInteger)indexPath
{
    NSString *item = [[DDDataSource sharedManager] objectFromModel:CartoonCharactersModel index:indexPath];
    
    self.characterName.text = item;
    self.characterImame.image = [UIImage imageNamed:item];
}



@end