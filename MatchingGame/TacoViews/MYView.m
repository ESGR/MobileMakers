//
//  MYView.m
//  TacoViews
//
//  Created by alexchoi1 on 7/18/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "MYView.h"

@implementation MYView
@synthesize delegate;
@synthesize isWon;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"initwithframe");
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        mudkipview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mudkip7070.png"]];
        [self addSubview:mudkipview];
        mudkipview.alpha = 0;
        isWon = NO;
        
        
        
    }
    return self;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!isWon)
    {
        NSLog(@"TOUCH");
        
        [delegate didChooseView:self];
  ///      [delegate matchTag];
        
        ///boolean should switch last
  ///      [delegate switchBoolean];
        
    }
    
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    /// NSLog(@"touch moved tag:%i",self.tag);
    
    
}

-(void) increaseAlpha
{
    mudkipview.alpha = 1;
    
}
-(void) decreaseAlpha
{
    mudkipview.alpha = 0;
}

@end
