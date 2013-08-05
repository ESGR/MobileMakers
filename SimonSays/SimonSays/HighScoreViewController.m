//
//  HighScoreViewController.m
//  SimonSays
//
//  Created by alexchoi1 on 8/4/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "HighScoreViewController.h"

@interface HighScoreViewController ()
{
    
    __weak IBOutlet UILabel *scoreLabel;
    
    __weak IBOutlet UITextField *playerNameTextField;
    __weak IBOutlet UITableView *highScoresTableView;
}
- (IBAction)addPlayerNameAndScore:(id)sender;


@end

@implementation HighScoreViewController
@synthesize highScoresArray;
@synthesize score;
@synthesize highScoresDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"initwithnibname");
            
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.alpha = .75;
        self.view.opaque = NO;
    highScoresDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    

    
    highScoresTableView.backgroundColor = [UIColor clearColor];
        highScoresTableView.backgroundView.alpha = .5;

    
  //  highScoresArray = [NSMutableArray arrayWithArray:@[@"ac 200", @"ac 500"]];

    
        NSLog(@"high score array %@ score %i", highScoresArray,score);
    
    scoreLabel.text = [NSString stringWithFormat:@"Your Score Was: %i",score];
   
    
    playerNameTextField.text = @"WTF is your name";
    
    playerNameTextField.clearsOnBeginEditing = YES;
    
   
      
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPlayerNameAndScore:(id)sender
{
    NSNumber * value = [NSNumber numberWithInt:score];
    NSString * key = [NSString stringWithFormat:@"%@       %@", playerNameTextField.text, value ];
    
    NSLog(@"score %i",score);
    NSLog(@"key %@", key);
    
    [highScoresDictionary setObject:value forKey:key];

    NSLog(@"highscoresdictionaryfrom hsvc%@", highScoresDictionary);
    [highScoresTableView reloadData];
    
    
    
    [UIView animateWithDuration:1 animations:^
    {
            [self.view removeFromSuperview];
    }
                     completion:^(BOOL finished)
    {
        NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:@"NewGame" object:nil];
        NSLog(@"new game notification posted");
    }];
    

}


#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ([highScoresDictionary allKeys]).count ;

}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    ///dictionary should be organized key: name and score value: score
    ///use keyssortedbyvalueusingcomparator method returns array of keys
    
    NSString * scoreString = [[highScoresDictionary allKeys] objectAtIndex:indexPath.row];

    cell.textLabel.text = scoreString;
    
    return cell;
}

#pragma mark UITableViewDelegate


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
