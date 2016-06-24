//
//  DACredentialsViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DACredentialsViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"
#import <Parse/Parse.h>


@interface DACredentialsViewController ()

@property (weak, nonatomic) IBOutlet UIView *credentialsViewOutlet;
@property (weak, nonatomic) IBOutlet UIButton *facebookLoginButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *loginButtonOutlet;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextFieldOutlet;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFieldOutlet;

@property BOOL keyboardShowing;

@end

@implementation DACredentialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.credentialsViewOutlet.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookLoginButtonPressed:(id)sender {
    
    NSArray *permissionsArray = @[@"public_profile", @"user_birthday"];
    
    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        if(!user){
            NSLog(@"Uh oh. The user cancelled the Facebook login");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook");
            [self dismissViewControllerAnimated:YES completion:^{
                [self.delegate successfulLogin];
            }];
        } else {
            NSLog(@"User logged in through Facebook");
            [self dismissViewControllerAnimated:YES completion:^{
                [self.delegate successfulLogin];
            }];
        }
    }];
    
    /*
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile", @"user_friends", @"read_friendlists", @"user_status", @"friends_status"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            NSLog(@"Logged in");
            
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            [appDelegate.window setRootViewController:appDelegate.tabBarController];
        }
    }];
    */
     
}

- (IBAction)loginButtonPressed:(id)sender {
    
    [PFUser logInWithUsernameInBackground:self.usernameTextFieldOutlet.text password:self.passwordTextFieldOutlet.text block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        
        self.credentialsViewOutlet.alpha = 0.25f;
        self.facebookLoginButtonOutlet.enabled = NO;
        self.loginButtonOutlet.enabled = NO;
        
        if(user) {
            
            [self dismissViewControllerAnimated:YES completion:^{
                
                [self.delegate successfulLogin];
            }];
        }
        
        else {
            
            NSLog(@"%@", error);
            
            self.credentialsViewOutlet.alpha = 1;
            self.facebookLoginButtonOutlet.enabled = YES;
            self.loginButtonOutlet.enabled = YES;
        }        
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event  {
    NSLog(@"touches began");
    [[self view] endEditing:YES];
    UITouch *touch = [touches anyObject];
    if(touch.view!=self.credentialsViewOutlet && !self.keyboardShowing){
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
