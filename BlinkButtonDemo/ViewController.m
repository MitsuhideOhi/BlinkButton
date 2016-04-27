//
//  ViewController.m
//  BlinkButtonDemo
//
//  Created by ぷしゆ on 2014/04/06.
//  Copyright (c) 2014年 hi-enta. All rights reserved.
//

#import "ViewController.h"
#import "BlinkButton.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet BlinkButton *blinkButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)blinkButtonPushed:(id)sender{
    if(self.blinkButton.isBlinking){
        [self.blinkButton stopBlink];
        [self.blinkButton setTitle:@"Start blink." forState:UIControlStateNormal];
    }else{
        [self.blinkButton startBlink];
        [self.blinkButton setTitle:@"Stop blink." forState:UIControlStateNormal];
    }
}

@end
