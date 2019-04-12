//
//  Assembly.m
//  MVP_Pong
//
//  Created by Вова on 11.04.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "SBSAssembly.h"

@implementation SBSAssembly

+(SBSView *) createDependency
{
    SBSModel *model = [[SBSModel alloc] initWithBackgroundColor:[UIColor blackColor] paddleColor:[UIColor redColor] ballColor:[UIColor purpleColor]];
    SBSView *view = [[SBSView alloc] init];
    SBSPresenter *presenter = [[SBSPresenter alloc] initWithView:view andModel:model];
    view.presenter = presenter;
    
    return view;
}

@end
