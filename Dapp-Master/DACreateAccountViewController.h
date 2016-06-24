//
//  DACreateAccountViewController.h
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DACreateAccountViewControllerDelegate <NSObject>

@required

-(void)normalizeScreen;
-(void)successfulLogin;

@end

@interface DACreateAccountViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <DACreateAccountViewControllerDelegate> delegate;

@end
