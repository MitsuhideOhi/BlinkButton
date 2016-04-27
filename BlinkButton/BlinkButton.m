//
//  BlinkButton.m
//  bookmarkplus
//
//  Created by Ohi Mitsuhide on 2014/03/27.
//  Copyright (c) 2014年 hi-enta. All rights reserved.
//

#import "BlinkButton.h"
#import <QuartzCore/QuartzCore.h>

static const CGFloat kDefaultAnimationDuration = 0.3f;
static const CGFloat kDefaultAnimationDelay = 0.f;
static const CGFloat kDefaultMinimumAlpha = 0.4f;
static const CGFloat kDefaultMaximumAlpha = 1.f;

@implementation BlinkButton

#pragma mark - public

- (void)awakeFromNib{
    self.animationDuration = kDefaultAnimationDuration;
    self.animationDelay = kDefaultAnimationDelay;
    self.minimumAlpha = kDefaultMinimumAlpha;
    self.maximumAlpha = kDefaultMaximumAlpha;
}

- (void)startBlink{
    if(self.isBlinking){
        return;
    }
    self.isBlinking = YES;
    [self blinkAnimation];
}

- (void)stopBlink{
    if(!self.isBlinking){
        return;
    }
    self.isBlinking = NO;
    [self changeAlphaAnimationWithAlpha:self.maximumAlpha withCompletion:nil];
}

#pragma mark - private

- (void)blinkAnimation{
    if(![self shouldContinueToBlink])return;
    [self changeAlphaAnimationWithAlpha:self.minimumAlpha withCompletion:^{
        if(![self shouldContinueToBlink])return;
        [self changeAlphaAnimationWithAlpha:self.maximumAlpha withCompletion:^{
            [self blinkAnimation];
        }];
    }];
}

- (void)changeAlphaAnimationWithAlpha:(CGFloat)alpha withCompletion:(void (^)())completion{
    [self.layer removeAllAnimations];
    [UIView animateWithDuration:self.animationDuration
                          delay:self.animationDelay
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.alpha = alpha;
                     }completion:^(BOOL complete){
                         if(completion){
                             completion();
                         }
                     }];
}

- (BOOL)shouldContinueToBlink{
    if(self.isBlinking == NO){
        [self stopBlink];
        return NO;
    }else{
        return YES;
    }
}



@end
