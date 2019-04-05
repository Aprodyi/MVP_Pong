//
//  Model.h
//  Pong
//
//  Created by Вова on 29.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (strong, nonatomic) UIColor *gameBackgroundColor;
@property (strong, nonatomic) UIColor *paddleColor;
@property (strong, nonatomic) UIColor *ballColor;

-(id)initWithColor:(UIColor *)gameBackgroundColor paddleColor: (UIColor *)paddleColor ballColor: (UIColor *)ballColor;

@end

NS_ASSUME_NONNULL_END
