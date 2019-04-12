//
//  Model.m
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "SBSModel.h"

@implementation SBSModel

-(instancetype) initWithBackgroundColor:(UIColor *)gameBackgroundColor paddleColor:(UIColor *)paddleColor ballColor:(UIColor *)ballColor
{
    if (self = [super init])
    {
        _gameBackgroundColor = gameBackgroundColor;
        _paddleColor = paddleColor;
        _ballColor = ballColor;
    }
    return self;
}

@end
