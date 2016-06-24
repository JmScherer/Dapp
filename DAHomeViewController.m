//
//  DAHomeViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAHomeViewController.h"
#import "DACreateGroupViewController.h"
#import "DAGroupHomeViewController.h"
#import "DALoginViewController.h"
#import "DAEditAccountViewController.h"

@interface DAHomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *greetingsLabel;
@property (strong, nonatomic) DAEditAccountViewController *editVC;

@end

@implementation DAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.tabBarController.tabBar.hidden = NO;
    
    self.greetingsLabel.text = [NSString stringWithFormat:@"Hello %@!", [PFUser currentUser].username];
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAccount:)];
    
    NSArray *rightBarButtons = [[NSArray alloc] initWithObjects:rightBarButton, nil];
    
    [self.navigationItem setRightBarButtonItems:rightBarButtons];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Group"];
    [query includeKey:@"member_leader"];
    [query whereKey:@"member_leader" equalTo:[PFUser currentUser]];
    [query whereKey:@"active" equalTo:[NSNumber numberWithBool:YES]];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
        
        if(!error) {
            NSLog(@"%@", object);
            
            DAGroupHomeViewController *groupHome = [[DAGroupHomeViewController alloc] init];
            
            NSArray *tempArray = [NSArray arrayWithObject:groupHome];
            
            [self.navigationController setViewControllers:tempArray animated:YES];
            
        }
        else {
            NSLog(@"%@", error);
            
            
        }
        
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)makeGroupButtonPressed:(id)sender {
    
    DACreateGroupViewController *groupVC = [[DACreateGroupViewController alloc] init];
    
    [self.navigationController pushViewController:groupVC animated:YES];
    
}

-(void)groupHomeSwap {
    
    NSLog(@"Swap Happened");
    
}

-(void)editAccount:(UIBarButtonItem *)sender {
    
    UIView *childView = [self getRightView];
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    
    //[self.view bringSubviewToFront:childView];
    [currentWindow addSubview:childView];
    
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        childView.frame = CGRectMake(0 + self.view.frame.size.width/3, 0, childView.frame.size.width, childView.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                         }
                     }];
    
}

-(UIView *)getRightView {
    // init view if it doesn't already exist
    if (_editVC == nil)
    {
        // this is where you define the view for the right panel
        self.editVC = [[DAEditAccountViewController alloc] initWithNibName:@"DAEditAccountViewController" bundle:nil];
        //self.rightPanelViewController.view.tag = RIGHT_PANEL_TAG;
        //self.editVC.delegate = _editVC;
        
        [self.view addSubview:self.editVC.view];
        
        [self addChildViewController:self.editVC];
        [_editVC didMoveToParentViewController:self];
        
        _editVC.view.frame = CGRectMake(self.view.frame.size.width + self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    UIView *view = self.editVC.view;
    return view;
}

@end
