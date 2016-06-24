//
//  DALoginViewController.h
//  Dapp-Master
//
//  Created by James Scherer on 6/6/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DACredentialsViewController.h"
#import "DACreateAccountViewController.h"

@interface DALoginViewController : UIViewController <DACreateAccountViewControllerDelegate, DACredentialsViewControllerDelegate>

@end
