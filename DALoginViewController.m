//
//  DALoginViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/6/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DALoginViewController.h"
#import "TransitionDelegate.h"
#import "AppDelegate.h"
#import "DAGroupHomeViewController.h"

@interface DALoginViewController ()

@property (nonatomic, strong) TransitionDelegate *transitionController;

@property (weak, nonatomic) IBOutlet UIButton *signupButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *loginButtonOutlet;

@end

@implementation DALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"Did this view load?");
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    NSLog(@"Login Button Pressed");
    
    self.view.alpha = 0.25f;
    
    DACredentialsViewController *credentialsController = [[DACredentialsViewController alloc] init];
    [credentialsController setDelegate:self];
    credentialsController.view.backgroundColor = [UIColor clearColor];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:credentialsController];
    [navController setTransitioningDelegate:self.transitionController];
    navController.modalPresentationStyle = UIModalPresentationCustom;
    navController.navigationBar.hidden = YES;
    [self presentViewController:navController animated:YES completion:nil];
    
}

- (IBAction)signupButtonPressed:(UIButton *)sender {
    
    NSLog(@"Sign Up Button Pressed");
    
    self.view.alpha = 0.25f;
    
    DACreateAccountViewController *createAccountController = [[DACreateAccountViewController alloc] init];
    [createAccountController setDelegate:self];
    createAccountController.view.backgroundColor = [UIColor clearColor];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:createAccountController];
    [navController setTransitioningDelegate:self.transitionController];
    navController.modalPresentationStyle = UIModalPresentationCustom;
    navController.navigationBar.hidden = YES;
    [self presentViewController:navController animated:YES completion:nil];
    
    
}

-(void)normalizeScreen {
    NSLog(@"Delegate fired");
    [self dismissViewControllerAnimated:YES completion:nil];
    self.view.alpha = 1;
    
}

-(void)successfulLogin {
    
    [self popLogin];
    
}

-(void)popLogin {

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
