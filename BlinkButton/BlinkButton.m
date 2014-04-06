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
static const CGFloat kDefaultMinimumAlpha = 0.5f;
static const CGFloat kDefaultMaximumAlpha = 1.f;

@interface BlinkButton ()
@property (nonatomic, assign) BOOL isBlinking;
@end

@implementation BlinkButton

#pragma mark - public

- (BOOL)toggleBlink{
    if(self.isBlinking){
        self.isBlinking = NO;
        [self stopBlink];
    }else{
        self.isBlinking = YES;
        [self blinkAnimation];
    }
    return self.isBlinking;
}

#pragma mark - private

- (void)blinkAnimation{
    if(![self shouldContinueToBlink])return;
    [self changeAlphaAnimationWithAlpha:kDefaultMinimumAlpha withCompletion:^{
        if(![self shouldContinueToBlink])return;
        [self changeAlphaAnimationWithAlpha:kDefaultMaximumAlpha withCompletion:^{
            [self blinkAnimation];
        }];
    }];
}

- (void)changeAlphaAnimationWithAlpha:(CGFloat)alpha withCompletion:(void (^)())completion{
    [self.layer removeAllAnimations];
    [UIView animateWithDuration:kDefaultAnimationDuration
                          delay:kDefaultAnimationDelay
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

- (void)stopBlink{
    [self changeAlphaAnimationWithAlpha:kDefaultMaximumAlpha withCompletion:nil];
}

@end
