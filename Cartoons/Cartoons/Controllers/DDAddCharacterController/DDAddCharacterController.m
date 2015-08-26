//
//  DDAddCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAddCharacterController.h"
#import "DDCharacterFactory.h"
#import "DDDataSource.h"
#import "NSString+Validations.h"

@interface DDAddCharacterController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end


@implementation DDAddCharacterController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.backgroundColor = [UIColor randomColor];
}

#pragma mark - Actions

- (IBAction)saveItemAction:(id)sender {
    
    NSError *error = NULL;
    
    if ([self.textField.text isValidModelWithError:&error]) {
        
        NSString *name = ([self.textField.text isEqualToString:@"New Character"]) ? [NSString stringWithFormat:@"%@, %@", self.textField.text, [NSString stringWithDate:[NSDate date]]]  : self.textField.text;
        
        [DDDataSource addCharacter:[DDCharacterFactory newModelWithName:name]];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end