//
//  DAEditAccountViewController.m
//  Dapp
//
//  Created by James Scherer on 6/23/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAEditAccountViewController.h"
#import "DALoginViewController.h"

@interface DAEditAccountViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *gesture;

@end

@implementation DAEditAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.navigationController.navigationBar.hidden = YES;
    //self.tabBarController.tabBar.hidden = YES;
    
    [self setupGestures];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutButtonPressed:(id)sender {
    
    [self movePanelToOriginalPosition];
    
    [PFUser logOut];
    
    //DAUser *user = [DAUser sharedInstance];
    
    //user.user = nil;
    //user.currentGroup = NO;
    
    NSLog(@"User After: %@", [PFUser currentUser]);
    
    DALoginViewController *login = [[DALoginViewController alloc] init];
    
    [self.navigationController presentViewController:login animated:YES completion:nil];
    
}

-(void)setupGestures {
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    
    [self.view addGestureRecognizer:panRecognizer];
}

-(void)movePanel:(id)recognizer {
    
    if([recognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
       // NSLog(@"I'm panning!");
        [self movePanelToOriginalPosition];

    }
    
    if([recognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        NSLog(@"I'm tapping");
    }
    
    NSLog(@"Parent View Controller: %@", self.parentViewController);
    
    [self movePanelToOriginalPosition];
    
}

-(void)movePanelToOriginalPosition {
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        //_centerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame = CGRectMake(self.view.frame.size.width + self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             //[self resetMainView];
                         }
                     }];
}


@end
