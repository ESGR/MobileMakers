//
//  WinView.m
//  SimonSays
//
//  Created by alexchoi1 on 8/3/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "WinView.h"


@implementation WinView
@synthesize score;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIView * backgroundView = [[UIView alloc] initWithFrame:CGRectMake(1, 1, self.frame.size.width, self.frame.size.height)];
        backgroundView.backgroundColor = [UIColor blueColor];
        backgroundView.alpha = .35;
        
        [self addSubview:backgroundView];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(1, 1, self.frame.size.width, self.frame.size.height)];
        label.numberOfLines = 2;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor greenColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self addSubview:label];
    }
    return self;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"NewGame" object:nil];
    NSLog(@"new game notification posted");
    [self removeFromSuperview];
}

-(void)didMoveToSuperview
{
    NSLog(@"did move to superview");
    [self refreshView];
    
}


-(void) refreshView
{
    label.text = [NSString stringWithFormat: @"HEY, YOU, LIKE, WON \n SCORE: %i", score];
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
