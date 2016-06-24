 //
//  AnimatedTransitioning.h
//  fitness_app
//
//  Created by James Scherer on 2/13/16.
//  Copyright © 2016 Applied Motions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresenting;

@end
