//
//  SBTransitionAnimator.m
//  ABC360
//
//  Created by dog_47 on 1/29/16.
//  Copyright © 2016 abc360.com. All rights reserved.
//

#import "SBTransitionAnimator.h"
#import "SBMenuViewController.h"

@implementation SBTransitionAnimator{
    Transition_Animator_Type _theType;
}



+(SBTransitionAnimator *)CreateAnimatorWithType:(Transition_Animator_Type)_type{
    id obj;
    obj=[[SBTransitionAnimator alloc]initWithType:_type];
    return obj;
}


-(id)initWithType:(Transition_Animator_Type)_type{
    if (self=[super init]) {
        _theType=_type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return [self getDurantion];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    if (_theType==Transition_Animator_Alpha) {
        UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        [[transitionContext containerView] addSubview:toViewController.view];
        toViewController.view.alpha = 0;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            fromViewController.view.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        return;
    }
    if (_theType==Transition_Animator_Scale) {
        UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        [[transitionContext containerView] addSubview:toViewController.view];
        toViewController.view.alpha = 0;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
            toViewController.view.alpha = 1;
        } completion:^(BOOL finished) {
            fromViewController.view.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        return;
    }
    if (_theType==Transition_Animator_ScaleBack) {
        UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        [[transitionContext containerView] addSubview:toViewController.view];
        toViewController.view.alpha = 0;
        toViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.transform = CGAffineTransformIdentity;
            toViewController.view.alpha = 1;
            fromViewController.view.alpha=0;
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        return;
    }
    
    if (_theType==Transition_Animator_MenuIn) {
        SBMenuViewController *fromVC = (SBMenuViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
        UIView *innerView = fromVC.menuImg.superview;
        CGPoint tmp2 = fromVC.menuImg.center;
        [[transitionContext containerView] insertSubview:toVC.view belowSubview:fromVC.view];
        
        fromVC.menuImg.transform=CGAffineTransformIdentity;
        //        CGPoint tmp=[fromVC.menuImg.superview convertPoint:fromVC.menuImg.center toView:fromVC.imgSuperView];
        CGPoint tmp=[fromVC.view convertPoint:fromVC.view.center toView:fromVC.menuImg.superview];
        toVC.view.maskView=fromVC.menuImg;
        
        
        //        if (fromVC.menuImg.superview != nil) {
        //            [fromVC.menuImg removeFromSuperview];
        //            [innerView addSubview:fromVC.menuImg];
        //        }
        //        fromVC.menuImg.center = tmp2;
        
        
        UIView *alphaView=[[UIView alloc]initWithFrame:toVC.view.bounds];
        alphaView.backgroundColor=[UIColor blackColor];
        //Animation
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromVC.view.alpha=0;
            fromVC.menuImg.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2.0f, [UIScreen mainScreen].bounds.size.height/2.0f);
            //            fromVC.menuImg.center = tmp;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3f animations:^{
                fromVC.menuImg.transform=CGAffineTransformMakeScale(10, 10);
                fromVC.view.alpha=0;
            }completion:^(BOOL finished) {
                
                
                [UIView animateWithDuration:0.7f animations:^{
                    [[transitionContext containerView] insertSubview:alphaView belowSubview:fromVC.view];
                    alphaView.alpha=0;
                    toVC.view.maskView=nil;
                }completion:^(BOOL finished) {
                    [alphaView removeFromSuperview];
                    fromVC.view.alpha=1;
                    //重置坐标
                    fromVC.menuImg.transform=CGAffineTransformIdentity;
                    
                    if (fromVC.menuImg.superview==nil) {
                        [innerView addSubview:fromVC.menuImg];
                    }
                    fromVC.menuImg.center=CGPointMake(30, 30);
                    
                    //finish
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }];
                
                
            } ];
            
            
        }];
        
        return;
    }
    
    if (_theType==Transition_Animator_MenuOut) {
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        SBMenuViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    }
    
//    if (_theType==Transition_Animator_BlurPush) {
//        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//        UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//        
//        UIView *containerView = [transitionContext containerView];
//        
//        [containerView addSubview:toVC.view];
//        
//        // Create snapshots
//        UIImage *fromSnapshot = [fromVC.view snapshot];
//        UIImage *toSnapshot   = [toVC.view snapshot];
//        
//        // Start animating using Core Image
//        CoreImageBlurTransitionView *transitionView = [[CoreImageBlurTransitionView alloc] initWithFrame:containerView.bounds
//                                                                                               fromImage:fromSnapshot
//                                                                                                 toImage:toSnapshot];
//        [transitionView changeTransition:CoreImageTransitionTypeBoxBlur];
//        [transitionView setDuration:1];
//        [[transitionContext containerView] addSubview:transitionView];
//        [transitionView start];
//        
//        // Finish after the duration
//        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW,
//                                             [self transitionDuration:transitionContext] * NSEC_PER_SEC);
//        dispatch_after(when, dispatch_get_main_queue(), ^{
//            [transitionView stop];
//            [transitionView removeFromSuperview];
//            [transitionContext completeTransition:YES];
//        });
//        return;
//    }
    
    
}

-(NSTimeInterval)getDurantion{
    if (_theType==Transition_Animator_Scale) {
        return 0.4f;
    }
    if (_theType==Transition_Animator_ScaleBack) {
        return 0.4f;
    }
    
    if (_theType==Transition_Animator_MenuIn) {
        return 0.5f;
    }
    
    return 1;
}


@end
