//
//  Model.m
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "Model.h"

@implementation Model

-(id) initWithColor:(UIColor *)gameBackgroundColor paddleColor:(UIColor *)paddleColor ballColor:(UIColor *)ballColor
{
    if (self = [super init])
    {
        self.gameBackgroundColor = gameBackgroundColor;
        self.paddleColor = paddleColor;
        self.ballColor = ballColor;
    }
    return self;
}

@end
