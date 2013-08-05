//
//  ColorPanelViewProtocol.h
//  SimonSays
//
//  Created by alexchoi1 on 8/1/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorPanelViewProtocol <NSObject>

-(void) panelFinished: (int) tag;
-(void) touchedView: (int) tag;


@end
