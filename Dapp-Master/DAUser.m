//
//  DAUser.m
//  Dapp-Master
//
//  Created by James Scherer on 6/13/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAUser.h"

@implementation DAUser

+(DAUser*)sharedInstance {
    
    static DAUser *myUserInstance = nil;
    
    if (myUserInstance.user != [PFUser currentUser]) {
        
        NSLog(@"Am I checking for new user group status?");
        
        myUserInstance = [[[self class] alloc] init];
        
        myUserInstance.user = [PFUser currentUser];
        
        PFQuery *groupQuery = [PFQuery queryWithClassName:@"Group"];
        [groupQuery whereKey:@"active" equalTo:[NSNumber numberWithBool:YES]];
        [groupQuery whereKey:@"member_leader" equalTo:[PFUser currentUser]];
        
        PFObject *tempObject = [groupQuery getFirstObject];
        
        myUserInstance.currentGroup = tempObject[@"active"];
        
    }
    
    return myUserInstance;
    
}

@end
