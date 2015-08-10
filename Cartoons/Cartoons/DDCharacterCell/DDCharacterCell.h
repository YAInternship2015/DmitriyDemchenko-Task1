//
//  DDCharacterCell.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDCharacterCell : UITableViewCell

#warning следующий метод не нужен, ячейка сама создается из одноименной xib'ы
+ (instancetype)initCharacterCell;
+ (NSString *)reuseIdentifier;

#warning когда создадите класс-модель, переименуйте метод. Например, модель называется Cartoon, и метод называется configWithCartoon:
- (void)configForItem:(id)item;

@end
