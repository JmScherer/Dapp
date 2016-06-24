//
//  DACredentialsViewController.h
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DACredentialsViewControllerDelegate <NSObject>

@required

-(void)normalizeScreen;
-(void)successfulLogin;

@end

@interface DACredentialsViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <DACredentialsViewControllerDelegate> delegate;

@end
