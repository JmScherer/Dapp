//
//  AnimatedTransitioning.m
//  fitness_app
//
//  Created by James Scherer on 2/13/16.
//  Copyright © 2016 Applied Motions. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "DALoginViewController.h"
#import "DACreateAccountViewController.h"

@implementation AnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext { return 0.25f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *inView = [transitionContext containerView];
    DACreateAccountViewController *toController = (DACreateAccountViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    DALoginViewController *fromController = (DALoginViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView addSubview:toController.view];
    
    CGRect screenRant = [[UIScreen mainScreen] bounds];
    [toController.view setFrame:CGRectMake(0, screenRant.size.height, fromController.view.frame.size.width, fromController.view.frame.size.height)];
    
    [UIView animateWithDuration:0.25f animations:^{
        [toController.view setFrame:CGRectMake(0, 0, fromController.view.frame.size.width, fromController.view.frame.size.height)];
    }
    completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
