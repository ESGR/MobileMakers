//
//  PauseView.m
//  MatchingGame
//
//  Created by alexchoi1 on 7/20/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "PauseView.h"

@implementation PauseView
@synthesize matches;
@synthesize misses;
@synthesize time;
@synthesize totalTime;
@synthesize score;
@synthesize totalScore;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        pauseLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 40, 280, 40)];
        pauseLabel.backgroundColor =  [UIColor clearColor];
        pauseLabel.text = @"PAUSED";
        pauseLabel.font = [UIFont boldSystemFontOfSize:48];
        pauseLabel.textColor = [UIColor redColor];
        [self addSubview:pauseLabel];
        
        matchesLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 280, 20)];
        matchesLabel.backgroundColor =  [UIColor clearColor];
        matchesLabel.font = [UIFont boldSystemFontOfSize:24];
        matchesLabel.textColor = [UIColor redColor];
        [self addSubview:matchesLabel];
        
        missesLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 130, 280, 20)];
        missesLabel.backgroundColor =  [UIColor clearColor];
        missesLabel.font = [UIFont boldSystemFontOfSize:24];
        missesLabel.textColor = [UIColor redColor];
        [self addSubview:missesLabel];
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 160, 280, 20)];
        timeLabel.backgroundColor =  [UIColor clearColor];
        timeLabel.font = [UIFont boldSystemFontOfSize:24];
        timeLabel.textColor = [UIColor redColor];
        [self addSubview:timeLabel];
        
        totalScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 190, 280, 20)];
        totalScoreLabel.backgroundColor =  [UIColor clearColor];
        totalScoreLabel.font = [UIFont boldSystemFontOfSize:24];
        totalScoreLabel.textColor = [UIColor redColor];
        [self addSubview:totalScoreLabel];
        
        totalTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 220, 280, 20)];
        totalTimeLabel.backgroundColor =  [UIColor clearColor];
        totalTimeLabel.font = [UIFont boldSystemFontOfSize:24];
        totalTimeLabel.textColor = [UIColor redColor];
        [self addSubview:totalTimeLabel];
        
        
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
-(void) updateLabels
{
    
    matchesLabel.text = [NSString stringWithFormat:@"Matches:%i",matches];
    missesLabel.text = [NSString stringWithFormat:@"Misses:%i",misses];
    timeLabel.text = [NSString stringWithFormat:@"Time:%i",time];
    totalScoreLabel.text = [NSString stringWithFormat:@"Score:%i",totalScore];
    totalTimeLabel.text = [NSString stringWithFormat:@"Total Time:%i",totalTime];
    
    
}
@end
