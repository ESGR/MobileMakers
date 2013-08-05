//
//  HighScoreViewController.h
//  SimonSays
//
//  Created by alexchoi1 on 8/4/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoreViewController : UIViewController

@property (strong, nonatomic) NSMutableArray * highScoresArray;
@property (strong, nonatomic) NSMutableDictionary * highScoresDictionary;
@property int score;

@end
