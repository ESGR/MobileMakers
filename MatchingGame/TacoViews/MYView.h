//
//  MYView.h
//  TacoViews
//
//  Created by alexchoi1 on 7/18/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DidChooseViewProtocol.h"

@interface MYView : UIView
{
    UIImageView * mudkipview;
}
- (void) increaseAlpha;
- (void) decreaseAlpha;
@property (strong, nonatomic) id <DidChooseViewProtocol> delegate;
@property BOOL isWon;




@end
