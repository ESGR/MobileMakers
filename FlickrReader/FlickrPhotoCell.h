//
//  FlickrPhotoCell.h
//  FlickrReader
//
//  Created by alexchoi1 on 8/10/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class FlickrPhoto;
@interface FlickrPhotoCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;
@end
