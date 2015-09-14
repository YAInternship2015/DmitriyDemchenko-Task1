//
//  DDCharacterCollectionCell.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/22/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDCharacterCollectionCell.h"

@interface DDCharacterCollectionCell ()

@property (nonatomic, weak) IBOutlet UIImageView *characterImage;

@end


@implementation DDCharacterCollectionCell

- (void)configWithCartoons:(DDCharacter *)model {
    self.backgroundColor = [UIColor randomColor];
    self.characterImage.image = [UIImage imageNamed:model.imageName];
}

@end