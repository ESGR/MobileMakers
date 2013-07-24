//
//  ViewController.m
//  Word Browser
//
//  Created by alexchoi1 on 7/24/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "Word.h"
#import "WordViewController.h"

@interface ViewController ()
{
    NSMutableDictionary * dictionary;
    IBOutlet UITableView * tableView;
    
}

@end

@implementation ViewController


-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        Word * cat = [self makeWord:@"cat" withDefinition:@"domesticated feline"];
        Word * dog =    [self makeWord:@"dog" withDefinition:@"domesticated canine"];
        Word * clothes =    [self makeWord:@"clothes" withDefinition:@"covering for the body for either fashion or protection"];
        Word * car =    [self makeWord:@"car" withDefinition:@"four wheeled motorized vehicle"];
        Word * bicycle =    [self makeWord:@"bicycle" withDefinition:@"two wheeled human powered vehicle"];
        Word * table =[self makeWord:@"table" withDefinition:@"type of furniture often used for working on"];
        Word * chair =[self makeWord:@"chair" withDefinition:@"type of furniture often used for sitting on"];
        Word * pen =[self makeWord:@"pen" withDefinition:@"writing utensil. typically uses ink"];
        
        Word * kitty =    [self makeWord:@"kitty" withDefinition:@"colloquial name for a cat. see cat"];
        Word * puss =   [self makeWord:@"puss" withDefinition:@"colloquial, potentially risque name for a cat. see cat"];
        Word * pooch =   [self makeWord:@"pooch" withDefinition:@"colloquial name for a dog. see dog"];
        Word * threads =  [self makeWord:@"threads" withDefinition:@"colloquial term for clothes. see clothes"];
        Word * whip =   [self makeWord:@"whip" withDefinition:@"colloquial term for car. see car"];
        Word * bike =   [self makeWord:@"bike" withDefinition:@"colloquial term for a bicycle. see bicycle"];
        
        cat.synonyms = [NSMutableArray arrayWithArray: @[kitty, puss]];
        dog.synonyms = [NSMutableArray arrayWithArray:@[pooch]];
        clothes.synonyms = [NSMutableArray arrayWithArray:@[threads]];
        car.synonyms = [NSMutableArray arrayWithArray:@[whip]];
        bicycle.synonyms = [NSMutableArray arrayWithArray:@[bike]];
        
        kitty.synonyms = [NSMutableArray arrayWithArray: @[cat, puss]];
        puss.synonyms = [NSMutableArray arrayWithArray: @[kitty, cat]];
        pooch.synonyms = [NSMutableArray arrayWithArray: @[dog]];
        threads.synonyms = [NSMutableArray arrayWithArray: @[clothes]];
        whip.synonyms = [NSMutableArray arrayWithArray: @[car]];
        bike.synonyms = [NSMutableArray arrayWithArray: @[bicycle]];
        
        
        dictionary = [NSMutableDictionary dictionaryWithCapacity:20];
        
        NSArray * dictionaryLoader = @[cat,dog,clothes,car,bicycle,table,chair,pen,kitty,puss,pooch,threads,whip,bike];
        
        [dictionaryLoader enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [dictionary setObject:obj forKey:((Word *)obj).name];
        }];
        
        NSLog(@"%@",dictionary);
        
        
    }
    return self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"viewdidload");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Word *) makeWord: (NSString *) namev withDefinition: (NSString *) definitionv
{
    Word * word = [[Word alloc] init];
    word.name = namev;
    word.definition = definitionv;
    
    return word;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if ([segue.identifier isEqualToString:@"toWordController"])
    {
        NSIndexPath * indexPath = [tableView indexPathForSelectedRow];
        NSLog(@"%i", indexPath.row);
        
        UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        
        NSLog(@"%@",cell.textLabel.text);
        
        WordViewController * destination = [segue destinationViewController];
        
        destination.word = [dictionary objectForKey:cell.textLabel.text];
        
        
        
    }
}



#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numbersections");
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberrows");
    return [[dictionary allKeys] count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }
    /*
    NSArray *    dictionaryValuesArray = [dictionary allValues];
    Word * word = [dictionaryValuesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = word.name;
     */
    NSArray *    dictionaryKeysArray = [dictionary allKeys];
   NSString * wordString = [dictionaryKeysArray objectAtIndex:indexPath.row];
    cell.textLabel.text = wordString;
    
    return cell;
    
}


#pragma mark UITableViewDelegate


/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    ///showViewController.person = [peopleArray objectAtIndex:indexPath.row];
    /// [self.navigationController pushViewController:showViewController animated:YES];
    
    [self performSegueWithIdentifier:@"toWordController" sender:self];
    
}
@end
