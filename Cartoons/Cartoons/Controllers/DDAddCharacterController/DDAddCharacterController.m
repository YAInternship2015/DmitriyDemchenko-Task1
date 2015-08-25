//
//  DDAddCharacterController.m
//  Cartoons
//
//  Created by Dmitriy Demchenko on 8/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DDAddCharacterController.h"
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
        
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationDataFileContentDidChange object:nil];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end