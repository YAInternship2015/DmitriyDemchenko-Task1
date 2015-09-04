//
//  DDAddCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAddCharacterController.h"
#import "DDCharacterFactory.h"
#import "DDDataManager.h"
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
    
    self.textField.text = NSLocalizedString(@"New Character", nil);
    
    CAGradientLayer *gradient = [CAGradientLayer gradientForFrame:self.view.frame fromColor:[UIColor appYellowColor] toColor:[UIColor whiteColor]];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    [self.tap addTarget:self action:@selector(dismissKeyboard)];
/*
#warning рекогнайзер можно дабавить в сториборде
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
#warning это лучше сделать в сториборде
    self.textField.backgroundColor = [UIColor whiteColor];
 */
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

#pragma mark - Actions

- (IBAction)saveItemAction:(id)sender {
    
    NSError *error = NULL;
    
    if ([DDInputValidator validateInputString:self.textField.text error:&error]) {
        
        NSString *name = ([self.textField.text isEqualToString:NSLocalizedString(@"New Character", nil)]) ? [NSString stringWithFormat: @"%@ (%@)", self.textField.text, [NSString stringWithDate:[NSDate date]]]  : self.textField.text;
        
        [DDDataManager addCharacter:[DDCharacterFactory modelWithName:name]];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end