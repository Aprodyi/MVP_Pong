//
//  Presenter.h
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSModel.h"
#import "SBSView.h"

NS_ASSUME_NONNULL_BEGIN

@class SBSView;

@protocol PresenterProtocol <NSObject>

@required

-(void)gameField;
-(void)moveBall;
-(void)placeBottomPaddle: (CGPoint)currentPoint;
-(void)stopTimer;

@end

@interface SBSPresenter : NSObject <PresenterProtocol>

@property (strong, nonatomic) SBSView *passiveView;
@property (strong, nonatomic) SBSModel *model;

@property (assign, nonatomic) uint32_t topScore;
@property (assign, nonatomic) uint32_t bottomScore;

-(instancetype)initWithView: (SBSView *)view andModel: (SBSModel *)model;

-(void)startGame;
-(void)slow;
-(void)normal;
-(void)fast;

@end

NS_ASSUME_NONNULL_END
