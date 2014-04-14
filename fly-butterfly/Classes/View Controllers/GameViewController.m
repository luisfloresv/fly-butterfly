//
//  GameViewController.m
//  butterfly
//
//  Created by Luis Flores on 3/4/14.
//  Copyright (c) 2014 Iguana Studios. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapLabel.font = [UIFont fontWithName:LabelFont size:24];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self presentScene];
}

#pragma mark - SceneDelegate

- (void)gameStart {
    self.gameOverView.hidden = YES;
}

- (void)gameOver {
    [self shakeFrame];
    self.gameOverView.hidden = NO;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                  target:self
                                                selector:@selector(toggleLabelAlpha)
                                                userInfo:nil
                                                 repeats:YES];
}

#pragma mark - Private Methods

- (void)toggleLabelAlpha {
    [self.tapLabel setHidden:(!self.tapLabel.hidden)];
}

- (void)presentScene {
    [self track:@"Single Game"];

    self.gameOverView.hidden = YES;
    self.scene.size = self.gameView.bounds.size;
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    self.scene.delegate = self;
    [self.scene setup];

    [self.gameView presentScene:self.scene];
}

- (void)shakeFrame {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.05];
    [animation setRepeatCount:4];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([self.view  center].x - 4.0f, [self.view center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([self.view  center].x + 4.0f, [self.view center].y)]];
    [[self.view layer] addAnimation:animation forKey:@"position"];
}

#pragma mark - IBActions

- (IBAction)backButtonPressed {
    [[ISAudio sharedInstance] playSoundEffect:@"button_press.wav"];
    [self gamePrepare];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
