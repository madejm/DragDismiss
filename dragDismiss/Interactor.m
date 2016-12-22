//
//  Interactor.m
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import "Interactor.h"

@implementation Interactor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hasStarted = NO;
        self.shouldFinish = NO;
    }
    return self;
}

@end
