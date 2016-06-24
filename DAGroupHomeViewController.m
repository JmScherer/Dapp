//
//  DAGroupHomeViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/10/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAGroupHomeViewController.h"
#import "DALoginViewController.h"
#import "DACreateGroupViewController.h"
#import "DAEditAccountViewController.h"

@interface DAGroupHomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *memberLeaderLabel;
@property (weak, nonatomic) IBOutlet UILabel *member1Label;
@property (weak, nonatomic) IBOutlet UILabel *member2Label;
@property (weak, nonatomic) IBOutlet UILabel *member3Label;
@property (weak, nonatomic) IBOutlet UILabel *member4Label;
@property (weak, nonatomic) IBOutlet UILabel *member5Label;

@property (weak, nonatomic) IBOutlet UITextView *groupBioTextViewOutlet;

@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UIImageView *musicImage;
@property (weak, nonatomic) IBOutlet UIImageView *gamingImage;
@property (weak, nonatomic) IBOutlet UIImageView *partyImage;
@property (weak, nonatomic) IBOutlet UIImageView *sportsImage;

@property (strong, nonatomic) PFObject *groupObject;

@property (strong, nonatomic) DAEditAccountViewController *editVC;

@end

@implementation DAGroupHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.view.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAccount:)];
    
    NSArray *rightBarButtons = [[NSArray alloc] initWithObjects:rightBarButton, nil];
    
    [self.navigationItem setRightBarButtonItems:rightBarButtons];
    
    [[self.groupBioTextViewOutlet layer] setBorderColor:[[UIColor grayColor] CGColor]];
    
}

-(void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    
    NSLog(@"Group Home View Will Appear Method");
    
    PFQuery *query = [PFQuery queryWithClassName:@"Group"];
    [query includeKey:@"member_leader"];
    [query whereKey:@"member_leader" equalTo:[PFUser currentUser]];
    [query whereKey:@"active" equalTo:[NSNumber numberWithBool:YES]];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
        
        if(!error) {
            NSLog(@"%@", object);
            self.groupObject = object;
            [self updateScreen];
        }
        else {
            NSLog(@"%@", error);
        
            DAHomeViewController *newHome = [[DAHomeViewController alloc] init];
        
            NSArray *tempArray = [NSArray arrayWithObject:newHome];
        
            [self.navigationController setViewControllers:tempArray animated:YES];
        }
        
    }];
}

-(void)viewDidDisappear:(BOOL)animated {
    
    NSLog(@"Did this view disappear?");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateScreen{
    
    NSLog(@"This has been called");
    
    NSLog(@"%@", self.groupObject[@"interest_party"]);
    
    self.groupNameLabel.text = self.groupObject[@"group_name"];
    
    self.groupBioTextViewOutlet.text = self.groupObject[@"group_bio"];

    if(self.groupObject[@"interest_party"] == [NSNumber numberWithBool:NO]) {
        NSLog(@"Party Label should be hidden now");
        self.partyImage.hidden = YES;
    }
    
    if(self.groupObject[@"interest_event"] == [NSNumber numberWithBool:NO]) {
        NSLog(@"Event Label should be hidden now");
        self.eventImage.hidden = YES;
    }
    
    if(self.groupObject[@"interest_food"] == [NSNumber numberWithBool:NO]) {
        NSLog(@"Food Label should be hidden now");
        self.foodImage.hidden = YES;
    }
    
    if(self.groupObject[@"interest_gaming"] == [NSNumber numberWithBool:NO]) {
        NSLog(@"Gaming Label should be hidden now");
        self.gamingImage.hidden = YES;
    }
    
    if(self.groupObject[@"interest_music"] == [NSNumber numberWithBool:NO]) {
        NSLog(@"Music Label should be hidden now");
        self.musicImage.hidden = YES;
    }
    if(self.groupObject[@"interest_sports"] == [NSNumber numberWithBool:NO]) {
        NSLog(@"Sports Label should be hidden now");
        self.sportsImage.hidden = YES;
    }
    
    PFUser *leader = [self.groupObject objectForKey:@"member_leader"];
    
    NSLog(@"Group Leader: %@", leader.username);
    
    self.memberLeaderLabel.text = leader.username;
    
    PFUser *member1 = [self.groupObject objectForKey:@"member_1"];
    self.member1Label.text = member1.username;
    
    PFUser *member2 = [self.groupObject objectForKey:@"member_2"];
    self.member2Label.text = member2.username;
    
    PFUser *member3 = [self.groupObject objectForKey:@"member_3"];
    self.member3Label.text = member3.username;
    
    PFUser *member4 = [self.groupObject objectForKey:@"member_4"];
    self.member4Label.text = member4.username;
    
    PFUser *member5 = [self.groupObject objectForKey:@"member_5"];
    self.member5Label.text = member5.username;

}

- (IBAction)editGroupButtonPressed:(id)sender {
   
    DACreateGroupViewController *editVC = [[DACreateGroupViewController alloc] init];
    editVC.group = self.groupObject;
    [self.navigationController pushViewController:editVC animated:YES];
}

- (IBAction)deleteGroupButtonPressed:(id)sender {
    
    UIAlertController *deletionAlert = [UIAlertController alertControllerWithTitle:@"Delete Group" message:@"You are about to delete your group, would you like to proceed?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *deletionAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.groupObject[@"active"] = [NSNumber numberWithBool:NO];
        
        [self.groupObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            
            DAHomeViewController *newHome = [[DAHomeViewController alloc] init];
            
            NSArray *tempArray = [NSArray arrayWithObject:newHome];
            
            [self.navigationController setViewControllers:tempArray animated:YES];
            
        }];
    }];
    
    UIAlertAction *deletionCancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"You have averted nuclear war. Good job.");
    }];
    
    [deletionAlert addAction:deletionCancelAction];
    [deletionAlert addAction:deletionAction];
    [self presentViewController:deletionAlert animated:YES completion:nil];
    
}

-(void)editAccount:(UIBarButtonItem *)sender {
    
    UIView *childView = [self getRightView];
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    
    //[self.view bringSubviewToFront:childView];
    [currentWindow addSubview:childView];
    
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        //self.view.frame = CGRectMake(-self.view.frame.size.width + PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
        childView.frame = CGRectMake(0 + self.view.frame.size.width/3, 0, childView.frame.size.width, childView.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             //self.view.rightButton.tag = 0;
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

-(void)movePanelToOriginalPosition {
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        //_centerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _editVC.view.frame = CGRectMake(self.view.frame.size.width + self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self removeFromParentViewController];
                         }
                     }];
}

@end
