//
//  View.h
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSPresenter.h"

@class SBSPresenter;

NS_ASSUME_NONNULL_BEGIN

@protocol ViewProtocol <NSObject>

@required

-(void)showGameField: (UIColor *)backColor paddleColor: (UIColor *)paddleColor ballColor: (UIColor *)ballColor;
-(void)showStartGame: (double)speed;
-(void)showMoveBall;

@end

@interface SBSView : UIViewController <ViewProtocol>

@property (strong, nonatomic) UIView *topPaddle;
@property (strong, nonatomic) UIView *bottomPaddle;
@property (strong, nonatomic) UIView *ball;
@property (strong, nonatomic) UIView *pauseScreen;
@property (strong, nonatomic) UIButton *pauseButton;
@property (strong, nonatomic) SBSPresenter *presenter;

-(void)addTransitionAnimation;

@end

NS_ASSUME_NONNULL_END
