//
//  BlinkButton.h
//  bookmarkplus
//
//  Created by Ohi Mitsuhide on 2014/03/27.
//  Copyright (c) 2014年 hi-enta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlinkButton : UIButton
@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) CGFloat animationDelay;
@property (nonatomic, assign) CGFloat minimumAlpha;
@property (nonatomic, assign) CGFloat maximumAlpha;
@property (nonatomic, assign) BOOL isBlinking;
- (void)startBlink;
- (void)stopBlink;
@end
