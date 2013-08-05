//
//  WinView.h
//  SimonSays
//
//  Created by alexchoi1 on 8/3/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPanelViewProtocol.h"

@interface WinView : UIView
{
    UILabel * label;
}

@property int score;

//-(void) refreshView;

@end
