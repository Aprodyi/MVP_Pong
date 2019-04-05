//
//  Presenter.h
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "View.h"
NS_ASSUME_NONNULL_BEGIN

@class View;

@protocol PresenterProtocol <NSObject>

@required

-(id)initWithView: (View *)view withModel: (Model *)model;

-(void)setGameField;
-(void)setMoveBall;
-(void)setBottomPaddle: (CGPoint)currentPoint;
-(void)setStopTimer;

@end

@interface Presenter : NSObject

@property (strong, nonatomic) View *passiveView;
@property (strong, nonatomic) Model *model;

@property (assign, nonatomic) uint32_t topScore;
@property (assign, nonatomic) uint32_t bottomScore;

-(id)initWithView: (View *)view withModel: (Model *)model;

-(void)setGameField;
-(void)setStartGame;
-(void)setMoveBall;
-(void)setBottomPaddle: (CGPoint)currentPoint;
-(void)setStopTimer;
-(void)slow;
-(void)normal;
-(void)fast;

@end

NS_ASSUME_NONNULL_END
