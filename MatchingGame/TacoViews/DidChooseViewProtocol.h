//
//  DidChooseViewProtocol.h
//  TacoViews
//
//  Created by alexchoi1 on 7/18/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
///#import "MYView.h"

@class MYView;


@protocol DidChooseViewProtocol <NSObject>



-(void)didChooseView:(MYView *) myView;
///-(void)switchBoolean;

///-(void)matchTag;
-(void) resetGame;





@end
