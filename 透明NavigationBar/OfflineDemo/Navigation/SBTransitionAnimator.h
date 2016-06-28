//
//  SBTransitionAnimator.h
//  ABC360
//
//  Created by dog_47 on 1/29/16.
//  Copyright © 2016 abc360.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef  NS_ENUM (NSInteger,Transition_Animator_Type){
    Transition_Animator_None,
    Transition_Animator_BlurPush,
    Transition_Animator_Scale,
    Transition_Animator_ScaleBack,
    Transition_Animator_MenuIn,
    Transition_Animator_MenuOut,
    Transition_Animator_Alpha
};

@interface SBTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>


+(SBTransitionAnimator *)CreateAnimatorWithType:(Transition_Animator_Type)_type;

@end
