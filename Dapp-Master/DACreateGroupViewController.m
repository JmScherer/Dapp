//
//  DACreateGroupViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/9/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DACreateGroupViewController.h"
#import "DAInterestsViewController.h"


@interface DACreateGroupViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *memberLeaderImageOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *member1ImageOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *member2ImageOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *member3ImageOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *member4ImageOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *member5ImageOutlet;

@property (weak, nonatomic) IBOutlet UITextField *teamNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *teamBioTextField;

@property (nonatomic, assign) CGFloat visibleKeyboardHeight;

@end

@implementation DACreateGroupViewController

-(UIView *)currentFirstResponder {
    
    if([_teamBioTextField isFirstResponder]) {
        return _teamBioTextField;
    }
    
    if([_teamNameTextField isFirstResponder]) {
        return _teamNameTextField;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UITextFieldDelegate
    
    self.teamBioTextField.delegate = self;
    self.teamNameTextField.delegate = self;
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0f green:182.0/255.0f blue:72.0/255.0f alpha:1.0f];
    
    // Custom group class
    
    if(self.group == nil) {
        self.group = [[PFObject alloc] initWithClassName:@"Group"];
        self.group[@"interest_food"] = [NSNumber numberWithBool:NO];
        self.group[@"interest_event"] = [NSNumber numberWithBool:NO];
        self.group[@"interest_music"] = [NSNumber numberWithBool:NO];
        self.group[@"interest_gaming"] = [NSNumber numberWithBool:NO];
        self.group[@"interest_party"] = [NSNumber numberWithBool:NO];
        self.group[@"interest_sports"] = [NSNumber numberWithBool:NO];
    }
    
    NSLog(@"Group Object: %@", self.group);

    // Set up the view with the object
    
    self.teamNameTextField.text = self.group[@"group_name"];
    self.teamBioTextField.text = self.group[@"group_bio"];
    
    // Do any additional setup after loading the view from its nib.
    
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    
    self.memberLeaderImageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    self.member1ImageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    self.member2ImageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    self.member3ImageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    self.member4ImageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    self.member5ImageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    
    // Image 1
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap1.cancelsTouchesInView = YES;
    tap1.numberOfTapsRequired = 1;
    self.memberLeaderImageOutlet.userInteractionEnabled = YES;
    [self.memberLeaderImageOutlet addGestureRecognizer:tap1];
    [self.memberLeaderImageOutlet setTag:0];
    // Image 2
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap2.cancelsTouchesInView = YES;
    tap2.numberOfTapsRequired = 1;
    self.member1ImageOutlet.userInteractionEnabled = YES;
    [self.member1ImageOutlet addGestureRecognizer:tap2];
    [self.member1ImageOutlet setTag:1];
    
    // Image 3
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap3.cancelsTouchesInView = YES;
    tap3.numberOfTapsRequired = 1;
    self.member2ImageOutlet.userInteractionEnabled = YES;
    [self.member2ImageOutlet addGestureRecognizer:tap3];
    [self.member2ImageOutlet setTag:2];
    
    // Image 4
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap4.cancelsTouchesInView = YES;
    tap4.numberOfTapsRequired = 1;
    self.member3ImageOutlet.userInteractionEnabled = YES;
    [self.member3ImageOutlet addGestureRecognizer:tap4];
    [self.member3ImageOutlet setTag:3];
    
    // Image 5
    
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap5.cancelsTouchesInView = YES;
    tap5.numberOfTapsRequired = 1;
    self.member4ImageOutlet.userInteractionEnabled = YES;
    [self.member4ImageOutlet addGestureRecognizer:tap5];
    [self.member4ImageOutlet setTag:4];
    
    // Image 6
    
    UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap6.cancelsTouchesInView = YES;
    tap6.numberOfTapsRequired = 1;
    self.member5ImageOutlet.userInteractionEnabled = YES;
    [self.member5ImageOutlet addGestureRecognizer:tap6];
     [self.member5ImageOutlet setTag:5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectInterestsButtonPressed:(UIButton *)sender {
    
    self.group[@"member_leader"] = [PFUser currentUser];
    self.group[@"group_name"] = self.teamNameTextField.text;
    self.group[@"group_bio"] = self.teamBioTextField.text;
    
    NSLog(@"Group After: %@", self.group);
    
    DAInterestsViewController *interestVC = [[DAInterestsViewController alloc] init];
    interestVC.group = self.group;
    [self.navigationController pushViewController:interestVC animated:YES];
    
    
}

-(void)handleImageTap:(UIGestureRecognizer *)sender {
    
    NSLog(@"You tapped image #%li", [sender.view tag]);
    
    //NSLog(@"Group After: %@", self.group);
    
}


/*
-(void)_dismissKeyboard {
    [self.view endEditing:YES];
}

-(void)_registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)_keyboardWillShow:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    CGRect keyboardFrame = [self.view convertRect:endFrame toView:self.view.window];
    CGFloat visibleKeyboardHeight = CGRectGetMaxY(self.view.bounds) - CGRectGetMaxY(keyboardFrame);
    
    [self setVisibleKeyboardHeight:visibleKeyboardHeight animationDuration:duration animationOptions:curve << 16];
    
}

-(void)_keyboardWillHide:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    [self setVisibleKeyboardHeight:0.0 animationDuration:duration animationOptions:curve << 16];
}

-(void)setVisibleKeyboardHeight:(CGFloat)visibleKeyboardHeight animationDuration:(NSTimeInterval)animationDuration animationOptions:(UIViewAnimationOptions)animationOptions {
    
    dispatch_block_t animationsBlock = ^{
        self.visibleKeyboardHeight = visibleKeyboardHeight;
    };
    
    if(animationDuration == 0.0) {
        animationsBlock();
    } else {
        [UIView animateWithDuration:animationDuration
                              delay:0.0
                              options:animationOptions | UIViewAnimationOptionBeginFromCurrentState
                              animations:animationsBlock completion:nil];
    }
}

-(void)_updateViewContentOffsetAnimated:(BOOL)animated {
    CGPoint contentOffset = CGPointZero;
    if(self.visibleKeyboardHeight > 0.0f) {
        CGFloat offsetForScrollingTextFieldToTop = CGRectGetMinY([self currentFirstResponder].frame);
    }
    
    UIView *lowestView;
    if(_)
    
}
*/




-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [self.teamNameTextField resignFirstResponder];
    [self.teamBioTextField resignFirstResponder];
    
    return YES;
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    // Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [[self view] endEditing:YES];
}



@end
