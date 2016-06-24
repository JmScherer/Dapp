//
//  DACreateAccountViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DACreateAccountViewController.h"
#import "AppDelegate.h"

@interface DACreateAccountViewController ()

@property (weak, nonatomic) IBOutlet UIView *createAccountViewOutlet;
@property (weak, nonatomic) IBOutlet UIButton *facebookSignUpButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButtonOutlet;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextField *emailTextFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFieldOutlet;

@property (weak, nonatomic) IBOutlet UIView *accountCreatingViewOutlet;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *accountCreatingActivityOutlet;

@property BOOL keyboardShowing;

@end

@implementation DACreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.accountCreatingViewOutlet.hidden = YES;
    
    self.createAccountViewOutlet.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    //self.accountCreatingViewOutlet.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    self.usernameTextFieldOutlet.delegate = self;
    self.passwordTextFieldOutlet.delegate = self;
    self.emailTextFieldOutlet.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)facebookSignUpButtonPressed:(id)sender {
}

- (IBAction)createAccountButtonPressed:(id)sender {
    
    PFUser *newUser = [PFUser user];
    
    newUser.username = self.usernameTextFieldOutlet.text;
    newUser.password = self.passwordTextFieldOutlet.text;
    newUser.email = self.emailTextFieldOutlet.text;
    
    if([self.usernameTextFieldOutlet hasText] && [self.emailTextFieldOutlet hasText] && [self.passwordTextFieldOutlet hasText]) {
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        self.createAccountViewOutlet.alpha = 0.25;
        self.createAccountButtonOutlet.enabled = NO;
        self.facebookSignUpButtonOutlet.enabled = NO;
        self.usernameTextFieldOutlet.enabled = NO;
        self.passwordTextFieldOutlet.enabled = NO;
        self.emailTextFieldOutlet.enabled = NO;
     
     self.accountCreatingViewOutlet.hidden = NO;
     [self.accountCreatingActivityOutlet startAnimating];
        
        if(succeeded) {
            
            NSLog(@"Account Created");
            [self dismissViewControllerAnimated:YES completion:^{
                [self.delegate successfulLogin];
            }];
        }
        
        if (error) {
            //NSLog(@"%@", error);
            
            UIAlertController *signUpError = [UIAlertController alertControllerWithTitle:@"Error" message:@"Something has gone horribly wrong. Please check yo self." preferredStyle:UIAlertControllerStyleAlert];
            
            [signUpError addAction:[UIAlertAction actionWithTitle:@"I promise I won't wreck myself" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [self presentViewController:signUpError animated:YES completion:nil];

            
            NSLog(@"%@", error.debugDescription);
            
            self.createAccountViewOutlet.alpha = 1;
            self.createAccountButtonOutlet.enabled = YES;
            self.facebookSignUpButtonOutlet.enabled = YES;
            self.usernameTextFieldOutlet.enabled = YES;
            self.passwordTextFieldOutlet.enabled = YES;
            self.emailTextFieldOutlet.enabled = YES;
     
            self.accountCreatingViewOutlet.hidden = YES;
            [self.accountCreatingActivityOutlet stopAnimating];
            
            
            
            
        }
    }];
    }
    
    else {
        
        UIAlertController *signUpFieldAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Nice try, but you didn't put anything in." preferredStyle:UIAlertControllerStyleAlert];
        
        [signUpFieldAlert addAction:[UIAlertAction actionWithTitle:@"You caught me." style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [self presentViewController:signUpFieldAlert animated:YES completion:nil];
        
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event  {
    NSLog(@"touches began");
    [[self view] endEditing:YES];
    UITouch *touch = [touches anyObject];
        if(self.accountCreatingViewOutlet.hidden && touch.view!=self.createAccountViewOutlet && !self.keyboardShowing){
            [self.delegate normalizeScreen];
    }
}

-(void)keyboardDidShow:(NSNotification *)notification {
    
    self.keyboardShowing = YES;
    
}

-(void)keyboardDidHide:(NSNotification *)notification {
    
    self.keyboardShowing = NO;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
