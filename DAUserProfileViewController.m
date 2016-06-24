//
//  DAUserProfileViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/16/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAUserProfileViewController.h"

@interface DAUserProfileViewController ()

@property (weak, nonatomic) IBOutlet UITextView *teamBioTextViewOutlet;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UIImageView *musicImage;
@property (weak, nonatomic) IBOutlet UIImageView *gamingImage;
@property (weak, nonatomic) IBOutlet UIImageView *partyImage;
@property (weak, nonatomic) IBOutlet UIImageView *sportsImage;


@end

@implementation DAUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.hidden = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    PFUser *tempUser = self.groupObject[@"member_leader"];
    
    self.teamBioTextViewOutlet.text = self.groupObject[@"group_bio"];
    self.userNameLabel.text = tempUser.username;
    
}

-(void)viewWillAppear:(BOOL)animated {
    
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
