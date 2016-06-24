//
//  DAUser.h
//  Dapp-Master
//
//  Created by James Scherer on 6/13/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAUser : NSObject

@property (nonatomic, strong) PFUser *user;
@property BOOL currentGroup;

+(DAUser*)sharedInstance;

@end
