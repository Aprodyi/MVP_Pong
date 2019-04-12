//
//  Assembly.h
//  MVP_Pong
//
//  Created by Вова on 11.04.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSModel.h"
#import "SBSPresenter.h"
#import "SBSView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBSAssembly : NSObject

+(SBSView *) createDependency;

@end

NS_ASSUME_NONNULL_END
