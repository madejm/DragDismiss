//
//  Interactor.h
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#include <UIKit/UIKit.h>

@interface Interactor : UIPercentDrivenInteractiveTransition

@property(nonatomic,assign) bool hasStarted;
@property(nonatomic,assign) bool shouldFinish;

@end
