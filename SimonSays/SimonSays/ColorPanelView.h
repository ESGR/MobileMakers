//
//  ColorPanelView.h
//  SimonSays
//
//  Created by alexchoi1 on 8/1/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPanelViewProtocol.h"
@interface ColorPanelView : UIView  


{
    NSArray * colorAssignmentArray;
    UIColor * ownColor;
}
-(void) animate: (NSNotification *) tag;

@property (strong, nonatomic) id <ColorPanelViewProtocol>  delegate;

@end
