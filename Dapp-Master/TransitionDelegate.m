//
//  TransitionDelegate.m
//  fitness_app
//
//  Created by James Scherer on 2/13/16.
//  Copyright © 2016 Applied Motions. All rights reserved.
//

#import "TransitionDelegate.h"
#import "AnimatedTransitioning.h"

@implementation TransitionDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    AnimatedTransitioning *controller = [[AnimatedTransitioning alloc] init];
    controller.isPresenting = YES;
    
    return controller;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return nil;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

@end
