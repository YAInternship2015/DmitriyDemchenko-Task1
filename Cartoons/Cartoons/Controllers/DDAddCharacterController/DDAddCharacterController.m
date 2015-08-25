//
//  DDAddCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAddCharacterController.h"
#import "DDCreateCharacter.h"
#import "NSString+Validations.h"

@interface DDAddCharacterController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (assign, nonatomic) BOOL isValid;
@property (strong, nonatomic) DDCreateCharacter *character;

@end

@implementation DDAddCharacterController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.character = [[DDCreateCharacter alloc] init];
    
    self.textField.backgroundColor = [UIColor randomColor];
    self.isValid = YES;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self.character newModelFrom:self.textField.text];
}

#pragma mark - Private methods

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
    return YES;
}

#pragma mark - Actions

- (IBAction)saveItemAction:(id)sender {
    
    if (self.isValid) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end