//
//  Presenter.m
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "Presenter.h"

CGFloat dX = 1;
CGFloat dY = 1;

@interface Presenter()

@property (assign, nonatomic) double currentSpeed;
@property (strong, nonatomic) NSTimer *gameTimer;
@property (assign, nonatomic) CGPoint savePoint;

@end

@implementation Presenter

-(id)initWithView: (View *)view withModel: (Model *)model
{
    if (self = [super init])
    {
        self.passiveView = view;
        self.model = model;
    }
    return self;
}

-(void)setGameField
{
    self.topScore = 0;
    self.bottomScore = 0;
    [self.passiveView showGameField:self.model.gameBackgroundColor paddleColor:self.model.paddleColor ballColor: self.model.ballColor];
}

-(void)setStartGame
{
    self.passiveView.ball.center = self.passiveView.view.center;
    self.currentSpeed = 0.005f;
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:self.currentSpeed target:self.passiveView selector:@selector(showMoveBall) userInfo:nil repeats:YES];
}

-(void)setMoveBall
{
    // Простейшая проверка, чтобы topPaddle не уезжал за границы экрана
    if (self.passiveView.ball.center.x >= self.passiveView.view.frame.size.width - 30.0)
    {
        self.passiveView.topPaddle.center = CGPointMake(self.passiveView.view.frame.size.width - 30.0, 2.5);
    }
    else if (self.passiveView.ball.center.x <= 30.0)
    {
        self.passiveView.topPaddle.center = CGPointMake(30.0, 2.5);
    }
    else
    {
        self.passiveView.topPaddle.center = CGPointMake(self.passiveView.ball.center.x, 2.5);
    }
    
    if (CGRectIntersectsRect(self.passiveView.ball.frame, self.passiveView.topPaddle.frame) || CGRectIntersectsRect(self.passiveView.ball.frame, self.passiveView.bottomPaddle.frame))
    {
        dY *= -1;
    }
    
    if ((self.passiveView.ball.frame.origin.x + self.passiveView.ball.frame.size.width > self.passiveView.view.frame.size.width) ||
        (self.passiveView.ball.frame.origin.x < 0))
    {
        dX *= -1;
    }
    
    if (self.passiveView.ball.frame.origin.y + self.passiveView.ball.frame.size.height > self.passiveView.view.frame.size.height)
    {
        self.topScore++;
        [self resetOrContinueGame: YES];
    }
    
    if (self.passiveView.ball.frame.origin.y < 0)
    {
        // Сюда не зайдем никогда, т.к. наш ИИ не пропускает шарик
        self.bottomScore++;
        [self resetOrContinueGame: YES];
    }
    
    self.passiveView.ball.center = CGPointMake(self.passiveView.ball.center.x + dX, self.passiveView.ball.center.y + dY);
    
}

-(void)setBottomPaddle: (CGPoint)currentPoint
{
    // Простейшая проверка, чтобы bottomPaddle не уезжал за границы экрана
    if (currentPoint.x >= self.passiveView.view.frame.size.width - 30.0)
    {
        self.passiveView.bottomPaddle.center = CGPointMake(self.passiveView.view.frame.size.width - 30.0, self.passiveView.view.frame.size.height - 2.5);
    }
    else if (currentPoint.x <= 30.0)
    {
        self.passiveView.bottomPaddle.center = CGPointMake(30.0, self.passiveView.view.frame.size.height - 2.5);
    }
    else
    {
        self.passiveView.bottomPaddle.center = CGPointMake(currentPoint.x, self.passiveView.view.frame.size.height - 2.5);
    }
}

-(void)setStopTimer
{
    self.savePoint = self.passiveView.ball.center;
    [self.gameTimer invalidate];
    self.gameTimer = nil;
}

-(void)resetOrContinueGame: (BOOL) reset
{
    if (reset)
    {
        [self setStopTimer];
        self.passiveView.ball.center = self.passiveView.view.center;
        dY *= -1;
        dX *= -1;
    }
    else
    {
        [self.passiveView.pauseScreen removeFromSuperview];
        self.passiveView.ball.center = self.savePoint;
        [self.passiveView addTransitionAnimation];
    }
    
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:self.currentSpeed target:self.passiveView selector:@selector(showMoveBall) userInfo:nil repeats:YES];
}

-(void)slow
{
    self.currentSpeed = 0.01f;
    [self resetOrContinueGame: NO];
}

-(void)normal
{
    self.currentSpeed = 0.005f;
    [self resetOrContinueGame: NO];
}

-(void)fast
{
    self.currentSpeed = 0.0025f;
    [self resetOrContinueGame: NO];
}

@end
