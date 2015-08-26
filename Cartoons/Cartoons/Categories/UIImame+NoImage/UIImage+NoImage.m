//
//  UIImage+NoImage.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "UIImage+NoImage.h"

@implementation UIImage (NoImage)

+ (UIImage *)imageForNewItem {
    return [UIImage imageNamed:@"NoImage"];
}

@end