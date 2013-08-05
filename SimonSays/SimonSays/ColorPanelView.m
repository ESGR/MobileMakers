//
//  ColorPanelView.m
//  SimonSays
//
//  Created by alexchoi1 on 8/1/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ColorPanelView.h"

@implementation ColorPanelView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
        colorAssignmentArray = @[[UIColor redColor], [UIColor purpleColor], [UIColor blueColor], [UIColor yellowColor], [UIColor greenColor], [UIColor cyanColor]];
        ownColor = [colorAssignmentArray objectAtIndex:self.tag-1];
        self.backgroundColor = ownColor;
     
        
        NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(animate:) name:@"go" object:nil];
        
        
    }
    return self;
}


-(void) animate: (NSNotification *) notificationTag
{
    NSNumber * number = notificationTag.object;
    int tag = number.intValue;
    if (self.tag == tag)
    {
        [UIView animateWithDuration:1 animations:^{
            
            self.backgroundColor = [UIColor whiteColor];
            
        } completion:^(BOOL finished) {
            self.backgroundColor = ownColor;
            [delegate panelFinished:self.tag];
            
            
        }
         ];
    }
    
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
       [delegate touchedView: self.tag];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
