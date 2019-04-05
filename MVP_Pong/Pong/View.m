//
//  View.m
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "View.h"

@implementation View 

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.presenter setGameField];
    [self.presenter setStartGame];
}

-(void)showGameField: (UIColor *)backColor paddleColor: (UIColor *)paddleColor ballColor: (UIColor *)ballColor
{
    self.view.backgroundColor = backColor;
    
    self.topPaddle = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30.0, 0.0, 60.0, 5.0)];
    self.topPaddle.backgroundColor = paddleColor;
    [self.view addSubview: self.topPaddle];
    
    self.bottomPaddle = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30.0, self.view.frame.size.height - 5.0, 60.0, 5.0)];
    self.bottomPaddle.backgroundColor = paddleColor;
    [self.view addSubview: self.bottomPaddle];
    
    self.ball = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 30.0, 30.0)];
    self.ball.backgroundColor = ballColor;
    self.ball.layer.masksToBounds = YES;
    self.ball.layer.cornerRadius = self.ball.frame.size.width / 2;
    [self.view addSubview: self.ball];
    
    self.pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pauseButton.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2 - 40.0, CGRectGetHeight(self.view.frame)/2 - 15.0, 80.0, 30.0);
    self.pauseButton.backgroundColor = [UIColor greenColor];
    [self.pauseButton setTitle:@"Пауза" forState:UIControlStateNormal];
    [self.pauseButton addTarget:self action:@selector(pauseGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.pauseButton];
}

-(void)showStartGame: (double)speed
{
    [self.presenter setStartGame];
}

-(void)showMoveBall
{
    [self.presenter setMoveBall];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint currentPoint = [touch locationInView:self.view];
    [self.presenter setBottomPaddle: currentPoint];
}

-(void)pauseGame
{
    [self.presenter setStopTimer];
    
    self.pauseScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    self.pauseScreen.backgroundColor = [UIColor greenColor];
    
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - 200, CGRectGetHeight(self.view.frame)/4, 400, 160)];
    text.numberOfLines = 0;
    text.text = [[NSString alloc] initWithFormat:@"Счет\n\nКомпьютер - %d \n Игрок - %d \n\n\n Выберете скорость игры:",self.presenter.topScore, self.presenter.bottomScore];
    text.textAlignment = NSTextAlignmentCenter;
    [self.pauseScreen addSubview: text];
    
    UIButton *slowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    slowButton.frame = CGRectMake(0,CGRectGetHeight(self.view.frame)/4 + 160, CGRectGetWidth(self.view.frame)/3, 80);
    slowButton.backgroundColor = [UIColor lightGrayColor];
    [slowButton setTitle:@"Медленно" forState:UIControlStateNormal];
    [slowButton addTarget:self.presenter action:@selector(slow) forControlEvents:UIControlEventTouchUpInside];
    [self.pauseScreen addSubview: slowButton];
    
    UIButton *normalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    normalButton.frame = CGRectMake(CGRectGetWidth(self.view.frame)/3, CGRectGetHeight(self.view.frame)/4 + 160, CGRectGetWidth(self.view.frame)/3, 80);
    normalButton.backgroundColor = [UIColor grayColor];
    [normalButton setTitle:@"Обычная" forState:UIControlStateNormal];
    [normalButton addTarget:self.presenter action:@selector(normal) forControlEvents:UIControlEventTouchUpInside];
    [self.pauseScreen addSubview: normalButton];
    
    UIButton *fastButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fastButton.frame = CGRectMake(CGRectGetWidth(self.view.frame)*2/3, CGRectGetHeight(self.view.frame)/4 + 160, CGRectGetWidth(self.view.frame)/3, 80);
    fastButton.backgroundColor = [UIColor darkGrayColor];
    [fastButton setTitle:@"Быстро" forState:UIControlStateNormal];
    [fastButton addTarget:self.presenter action:@selector(fast) forControlEvents:UIControlEventTouchUpInside];
    [self.pauseScreen addSubview: fastButton];
    
    [self.view addSubview:self.pauseScreen];
    [self addTransitionAnimation];
}

-(void)addTransitionAnimation
{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    [self.view.layer addAnimation:transition forKey:kCATransition];
}

@end
