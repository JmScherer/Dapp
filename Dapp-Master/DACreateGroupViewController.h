//
//  DACreateGroupViewController.h
//  Dapp-Master
//
//  Created by James Scherer on 6/9/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DACreateGroupViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) PFObject *group;

@end
