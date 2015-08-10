//
//  Characters.h
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/7/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCharactersModel : NSObject

#warning Вы перепутали класс-модель и класс-датасорс. Данный класс - датасорс, он должен хранить массив моделей. 
#warning #warning Показывать наружу (в *.h файле) массив, еще и не readonly - плохая идя. Так любой может его занилить извне. В этом классе-датасорсе внутри (в *.m) должен быть один массив моделей. Также, в *.h файле необходимо показать минимальный интерфейс, который нужен вью контроллеру для работы, то есть нужен метод, который бы возвращал общее количество моделей, и метод, который бы возвращал модель по индексу (для ячейки). И все, массив же показывать не стоит

@property (strong, nonatomic) NSArray *cartoonCharacters;

@end