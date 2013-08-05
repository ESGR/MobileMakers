//
//  LoseView.m
//  SimonSays
//
//  Created by alexchoi1 on 8/3/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "LoseView.h"


@implementation LoseView
@synthesize score;
@synthesize highScoresArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(1, 1, self.frame.size.width, 100)];
        label.numberOfLines = 2;
        label.text = [NSString stringWithFormat:@"SORRY BRO YOU LOSE \n YOUR SCORE: %i", score ];
        label.textColor = [UIColor redColor];
        label.backgroundColor = [UIColor blueColor];
        label.alpha = .5;
        
        [self addSubview:label];
        
    
     
        
        
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        NSLog(@"loseview");
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(1, 1, 200, 200)];
        label.text = @"SORRY BRO YOU LOSE";
        label.textColor = [UIColor redColor];
            
        label.center = self.center;
    }
    return self;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  //  NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
   // [notificationCenter postNotificationName:@"NewGame" object:nil];
    //[self removeFromSuperview];
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
