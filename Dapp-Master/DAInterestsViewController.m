//
//  DAInterestsViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/9/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAInterestsViewController.h"
#import "DAGroupHomeViewController.h"
#import <Parse/Parse.h>

@interface DAInterestsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *foodButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *partyButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *gamingButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *entertainmentButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *musicButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *sportsButtonOutlet;

@end

@implementation DAInterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    NSLog(@"Group After: %@", self.group);
}

-(void)viewWillAppear:(BOOL)animated {
    
    if(self.group[@"interest_food"] == [NSNumber numberWithBool:NO]) {
        [self.foodButtonOutlet setSelected:NO];
        [self.foodButtonOutlet setImage:[UIImage imageNamed:@"food-g.png"] forState:UIControlStateNormal];
    } else {
        [self.foodButtonOutlet setSelected:YES];
        [self.foodButtonOutlet setImage:[UIImage imageNamed:@"food.png"] forState:UIControlStateSelected];
    }
    
    if(self.group[@"interest_party"] == [NSNumber numberWithBool:NO]) {
        [self.partyButtonOutlet setSelected:NO];
        [self.partyButtonOutlet setImage:[UIImage imageNamed:@"party-g.png"] forState:UIControlStateNormal];
    } else {
        [self.partyButtonOutlet setSelected:YES];
        [self.partyButtonOutlet setImage:[UIImage imageNamed:@"party.png"] forState:UIControlStateSelected];
    }
    
    if(self.group[@"interest_gaming"] == [NSNumber numberWithBool:NO]) {
        [self.gamingButtonOutlet setSelected:NO];
        [self.gamingButtonOutlet setImage:[UIImage imageNamed:@"gaming-g.png"] forState:UIControlStateNormal];
    } else {
        [self.gamingButtonOutlet setSelected:YES];
        [self.gamingButtonOutlet setImage:[UIImage imageNamed:@"gaming.png"] forState:UIControlStateSelected];
    }
    
    if(self.group[@"interest_event"] == [NSNumber numberWithBool:NO]) {
        [self.entertainmentButtonOutlet setSelected:NO];
        [self.entertainmentButtonOutlet setImage:[UIImage imageNamed:@"entertainment-g.png"] forState:UIControlStateNormal];
    } else {
        [self.entertainmentButtonOutlet setSelected:YES];
        [self.entertainmentButtonOutlet setImage:[UIImage imageNamed:@"entertainment.png"] forState:UIControlStateSelected];
    }
    
    if(self.group[@"interest_music"] == [NSNumber numberWithBool:NO]) {
        [self.musicButtonOutlet setSelected:NO];
        [self.musicButtonOutlet setImage:[UIImage imageNamed:@"music-g.png"] forState:UIControlStateNormal];
    } else {
        [self.musicButtonOutlet setSelected:YES];
        [self.musicButtonOutlet setImage:[UIImage imageNamed:@"music.png"] forState:UIControlStateSelected];
    }
    
    if(self.group[@"interest_sports"] == [NSNumber numberWithBool:NO]) {
        [self.sportsButtonOutlet setSelected:NO];
        [self.sportsButtonOutlet setImage:[UIImage imageNamed:@"sports-g.png"] forState:UIControlStateNormal];
    } else {
        [self.sportsButtonOutlet setSelected:YES];
        [self.sportsButtonOutlet setImage:[UIImage imageNamed:@"sports.png"] forState:UIControlStateSelected];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)foodButtonPressed:(id)sender {
    
    if(self.group[@"interest_food"] == [NSNumber numberWithBool:NO]){
        self.group[@"interest_food"] = [NSNumber numberWithBool:YES];
        [self.foodButtonOutlet setSelected:YES];
        [self.foodButtonOutlet setImage:[UIImage imageNamed:@"food.png"] forState:UIControlStateSelected];
        NSLog(@"%@", self.group[@"interest_food"]);
    }
    
    else {
        self.group[@"interest_food"] = [NSNumber numberWithBool:NO];
        [self.foodButtonOutlet setSelected:NO];
        [self.foodButtonOutlet setImage:[UIImage imageNamed:@"food-g.png"] forState:UIControlStateNormal];
        NSLog(@"%@", self.group[@"interest_food"]);
    }
}

- (IBAction)partyButtonPressed:(id)sender {
    
    if(self.group[@"interest_party"] == [NSNumber numberWithBool:NO]){
        self.group[@"interest_party"] = [NSNumber numberWithBool:YES];
        [self.partyButtonOutlet setSelected:YES];
        [self.partyButtonOutlet setImage:[UIImage imageNamed:@"party.png"] forState:UIControlStateSelected];
        NSLog(@"%@", self.group[@"interest_party"]);
    }
    else {
        self.group[@"interest_party"] = [NSNumber numberWithBool:NO];
        [self.partyButtonOutlet setSelected:NO];
        [self.partyButtonOutlet setImage:[UIImage imageNamed:@"party-g.png"] forState:UIControlStateNormal];
        NSLog(@"%@", self.group[@"interest_party"]);
    }
}

- (IBAction)gamingButtonPressed:(id)sender {
    
    if(self.group[@"interest_gaming"] == [NSNumber numberWithBool:NO]){
        self.group[@"interest_gaming"] = [NSNumber numberWithBool:YES];
        [self.gamingButtonOutlet setSelected:YES];
        [self.gamingButtonOutlet setImage:[UIImage imageNamed:@"gaming.png"] forState:UIControlStateSelected];
        NSLog(@"%@", self.group[@"interest_gaming"]);
    }
    
    else {
        self.group[@"interest_gaming"] = [NSNumber numberWithBool:NO];
        [self.gamingButtonOutlet setSelected:NO];
        [self.gamingButtonOutlet setImage:[UIImage imageNamed:@"gaming-g.png"] forState:UIControlStateNormal];
        NSLog(@"%@", self.group[@"interest_gaming"]);
    }
}

- (IBAction)entertainmentButtonPressed:(id)sender {
    
    if(self.group[@"interest_event"] == [NSNumber numberWithBool:NO]){
        self.group[@"interest_event"] = [NSNumber numberWithBool:YES];
        [self.entertainmentButtonOutlet setSelected:YES];
        [self.entertainmentButtonOutlet setImage:[UIImage imageNamed:@"entertainment.png"] forState:UIControlStateSelected];
        NSLog(@"%@", self.group[@"interest_event"]);
    }
    
    else {
        self.group[@"interest_event"] = [NSNumber numberWithBool:NO];
        [self.entertainmentButtonOutlet setSelected:NO];
        [self.entertainmentButtonOutlet setImage:[UIImage imageNamed:@"entertainment-g.png"] forState:UIControlStateNormal];
        NSLog(@"%@", self.group[@"interest_event"]);
    }
}

- (IBAction)musicButtonPressed:(id)sender {
    
    if(self.group[@"interest_music"] == [NSNumber numberWithBool:NO]){
        self.group[@"interest_music"] = [NSNumber numberWithBool:YES];
        [self.musicButtonOutlet setSelected:YES];
        [self.musicButtonOutlet setImage:[UIImage imageNamed:@"music.png"] forState:UIControlStateSelected];
        NSLog(@"%@", self.group[@"interest_music"]);
    }
    
    else {
        self.group[@"interest_music"] = [NSNumber numberWithBool:NO];
        [self.musicButtonOutlet setSelected:NO];
        [self.musicButtonOutlet setImage:[UIImage imageNamed:@"music-g.png"] forState:UIControlStateNormal];
        NSLog(@"%@", self.group[@"interest_music"]);
    }
}

- (IBAction)sportsButtonPressed:(id)sender {
    
    if(self.group[@"interest_sports"] == [NSNumber numberWithBool:NO]){
        self.group[@"interest_sports"] = [NSNumber numberWithBool:YES];
        [self.sportsButtonOutlet setSelected:YES];
        [self.sportsButtonOutlet setImage:[UIImage imageNamed:@"sports.png"] forState:UIControlStateSelected];
        NSLog(@"%@", self.group[@"interest_sports"]);
    }
    
    else {
        self.group[@"interest_sports"] = [NSNumber numberWithBool:NO];
        [self.sportsButtonOutlet setSelected:NO];
        [self.sportsButtonOutlet setImage:[UIImage imageNamed:@"sports-g.png"] forState:UIControlStateNormal];
        NSLog(@"%@", self.group[@"interest_sports"]);
    }
}

- (IBAction)makeGroupButtonPressed:(UIButton *)sender {
    
    self.group[@"active"] = [NSNumber numberWithBool:YES];
    
    NSLog(@"Final Group Object: %@", self.group);
    
    [self.group saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if(succeeded) {
            
            DAGroupHomeViewController *groupVC = [[DAGroupHomeViewController alloc] init];
            
            NSMutableArray *viewControllers = [self.tabBarController.viewControllers mutableCopy];
            
            UINavigationController *navTemp = [viewControllers objectAtIndex:0];
            
            [navTemp setViewControllers:[NSArray arrayWithObject:groupVC] animated:YES];
            
            self.tabBarController.viewControllers = viewControllers;
            
            [self.navigationController popToRootViewControllerAnimated:YES];

        }
        else {
            NSLog(@"%@", error);
        }
    }];
     
    
}

@end
