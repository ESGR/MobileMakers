//
//  ViewController.m
//  MMPersistanceScaffold
//
//  Created by Don Bora on 6/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *oTableView;
    NSArray* people;
    NSFileManager * fileManager;
    NSURL *documentsDirectory;
    NSManagedObjectContext * managedObjectContext;
    NSMutableArray * coreDataPeople;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"]];
    
    [super viewDidLoad];
    
    managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    fileManager = [NSFileManager defaultManager];
    documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSLog(@"%@",documentsDirectory.path);
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasJsonData"])
    {
        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue currentQueue]
                               completionHandler:
         ^(NSURLResponse* response, NSData* data, NSError* error)
         {
             people = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
             [people writeToURL:[documentsDirectory URLByAppendingPathComponent:@"people.plist"] atomically:YES];
             
             if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasData"])
             {
                 for (NSDictionary* dictionary in people)
                 {
                     
                     Person * person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
                     
                     NSURL *url = [NSURL URLWithString:[dictionary valueForKey:@"avatar_url"]];
                     NSData *data = [NSData dataWithContentsOfURL:url];
                     NSString *imageFileName = [[url pathComponents] lastObject];
                     NSURL *localImageURL = [documentsDirectory URLByAppendingPathComponent:imageFileName];
                     
                     person.name = [dictionary objectForKey:@"name"];
                     person.image = [localImageURL absoluteString];
                     person.superDescription = [dictionary objectForKey:@"description"];
                     
                     [coreDataPeople addObject:person];
                     
                     NSLog(@"building person and adding to coreDataPeopleArray");
                     
                     if (![fileManager fileExistsAtPath:[localImageURL path]])
                     {
                         [data writeToURL:localImageURL atomically:YES];
                     }
                 }
             }
             
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasData"];
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasJsonData"];
             [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"Date"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
             if([managedObjectContext save:&error])
             {
                 NSLog(@"error: %@", error.userInfo);
             }
             
             [oTableView reloadData];
             
         }
         ];
    }
    else
    {
        NSLog(@"fetching from managedObjectContext");
        NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
        NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
        NSFetchedResultsController * fetchedResultsController;
        NSError * error;
        NSSortDescriptor * sortDescriptor;
        NSArray * sortedDescriptors;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        sortedDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [fetchRequest setEntity: entityDescription];
        [fetchRequest setSortDescriptors:sortedDescriptors];
        fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        [fetchedResultsController performFetch:&error];
        coreDataPeople = fetchedResultsController.fetchedObjects;
    }
    
    NSMutableArray *noDuplicates = [NSMutableArray arrayWithCapacity:50];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [coreDataPeople count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* NSURL *url = [NSURL URLWithString:[[people objectAtIndex:indexPath.row] valueForKey:@"avatar_url"]];
     NSString *imageFileName = [[url pathComponents] lastObject];
     NSURL *localImageURL = [documentsDirectory URLByAppendingPathComponent:imageFileName];
     NSURL *data = [NSData dataWithContentsOfURL:localImageURL];
     */
    
    
    UITableViewCell* tableViewCell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Superhero" forIndexPath:indexPath];
    
    /*
     tableViewCell.textLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"name"];
     tableViewCell.detailTextLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"description"];
     tableViewCell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"avatar_url"]]]];
     
     tableViewCell.imageView.image = [UIImage imageWithData:data];
     */
    Person * person = [coreDataPeople objectAtIndex:indexPath.row];
    
    
    NSURL * url = [NSURL URLWithString:person.image];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    
    
    
    tableViewCell.textLabel.text = person.name;
    tableViewCell.detailTextLabel.text = person.superDescription;
    tableViewCell.imageView.image = image;
    
    
    
    return tableViewCell;
}


@end
