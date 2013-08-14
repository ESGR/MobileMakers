//
//  ViewController.m
//  FlickrReader
//
//  Created by alexchoi1 on 8/10/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    
    __weak IBOutlet UICollectionView *oCollectionView;
}


@end

@implementation ViewController
@synthesize searches;
@synthesize searchResults;
@synthesize flickr;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    searches = [@[] mutableCopy];
    searchResults = [@{} mutableCopy];
    flickr = [[Flickr alloc] init];
    
   // [oCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"FlickrCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
      [flickr searchFlickrForTerm:searchBar.text completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error)
     {
         
         if (results && results.count > 0)
         {
             if (![searches containsObject:searchTerm])
             {
                 NSLog(@"Found %d photos matching %@", results.count, searchTerm);
                 [searches insertObject:searchTerm atIndex:0];
                 searchResults[searchTerm] = results;
             }
             
             dispatch_async(dispatch_get_main_queue(), ^
                            {
                                [oCollectionView reloadData];                            });
         }
         else
         {
             NSLog(@"error searching flickr: %@", error.localizedDescription);
         }
     }];
    [searchBar resignFirstResponder];
    
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    NSString *searchTerm = self.searches[section];
    return [self.searchResults[searchTerm] count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return [self.searches count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FlickrPhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    NSString *searchTerm = self.searches[indexPath.section];
    cell.photo = self.searchResults[searchTerm]
    [indexPath.row];
    return cell; }

/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *searchTerm = self.searches[indexPath.section]; FlickrPhoto *photo =
    self.searchResults[searchTerm][indexPath.row];
    // 2
    CGSize retval = photo.thumbnail.size.width > 0 ? photo.thumbnail.size : CGSizeMake(100, 100);
    retval.height += 35; retval.width += 35; return retval;
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end
