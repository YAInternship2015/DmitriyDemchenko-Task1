//
//  DDAddCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAddCharacterController.h"
#import "DDInputValidator.h"

@interface DDAddCharacterController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tap;

@end

@implementation DDAddCharacterController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.textField.text = [@"New Character" localized];
    
    CAGradientLayer *gradient = [CAGradientLayer gradientForFrame:self.view.frame fromColor:[UIColor appYellowColor] toColor:[UIColor whiteColor]];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    [self.tap addTarget:self action:@selector(dismissKeyboard)];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Private methods

-(void)dismissKeyboard {
    [self.textField resignFirstResponder];
}

#pragma mark - IBActions

- (IBAction)saveItemAction:(id)sender {
    
    NSError *error = NULL;
    
    if ([DDInputValidator validateInputString:self.textField.text error:&error]) {
        
        NSString *name = ([self.textField.text isEqualToString:[@"New Character" localized]]) ? [NSString stringWithFormat: @"%@ (%@)", self.textField.text, [NSString stringWithDate:[NSDate date]]]  : self.textField.text;
        
        DDCharacter *addCharacter = [DDCharacter MR_createEntity];
        addCharacter.name = name;
        addCharacter.imageName = NoImage;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end