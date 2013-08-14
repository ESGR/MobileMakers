//
//  ViewController.h
//  FlickrReader
//
//  Created by alexchoi1 on 8/10/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flickr.h"
#import "FlickrPhoto.h"
#import "FlickrPhotoCell.h"

@interface ViewController : UIViewController <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSMutableDictionary * searchResults;
@property(nonatomic, strong) NSMutableArray * searches;
@property(nonatomic, strong) Flickr * flickr;



@end
