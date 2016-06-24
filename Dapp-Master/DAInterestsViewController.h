//
//  DAInterestsViewController.h
//  Dapp-Master
//
//  Created by James Scherer on 6/9/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@protocol DAInterestsViewControllerDelegate <NSObject>

@end

@interface DAInterestsViewController : UIViewController

@property (weak, nonatomic) id <DAInterestsViewControllerDelegate> delegate;

@property (strong, nonatomic) PFObject *group;


@end
