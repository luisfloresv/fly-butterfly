//
//  BaseScene.h
//  butterfly
//
//  Created by Luis Flores on 3/30/14.
//  Copyright (c) 2014 Iguana Studios. All rights reserved.
//

@import SpriteKit;

#import <ISGameCenter/ISGameCenter.h>
#import "Butterfly.h"
#import "Crow.h"
#import "Constants.h"
#import "Utilities.h"

@protocol SceneDelegate <NSObject>
@required
- (void)gameStart;
- (void)gameOver;
@optional
- (void)gamePrepare;
@end

static SKAction *CrowSound;
static SKAction *FlapSound;

@interface BaseScene : SKScene <SKPhysicsContactDelegate>

@property (weak, nonatomic) id<SceneDelegate> delegate;
@property (strong, nonatomic) Butterfly *butterfly;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) SKAction *movePoint;
@property (nonatomic) CGFloat initialPoint;
@property (nonatomic) CFTimeInterval deltaTime;
@property (nonatomic) NSInteger crowCounter;

+ (SKAction *)crowSound;
+ (SKAction *)flapSound;
- (CGFloat)crowPositionY;
- (void)gameOver;
- (void)setup;
- (void)setupButterfly;
- (void)setupCrows;
- (void)touchesBeganGameStateRunning;
- (void)updateCrows;

@end
