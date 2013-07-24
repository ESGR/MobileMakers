//
//  PauseView.h
//  MatchingGame
//
//  Created by alexchoi1 on 7/20/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PauseView : UIView
{
    UILabel * pauseLabel;
    UILabel * matchesLabel;
    UILabel * missesLabel;
    UILabel * timeLabel;
    UILabel * totalTimeLabel;
    UILabel * scoreLabel;
    UILabel * totalScoreLabel;
}
-(void) updateLabels ;

@property int matches;
@property int misses;
@property int time;
@property int totalTime;
@property int score;
@property int totalScore;


@end
