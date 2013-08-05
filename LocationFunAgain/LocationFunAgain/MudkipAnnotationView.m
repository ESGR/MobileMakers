//
//  MudkipAnnotationView.m
//  LocationFunAgain
//
//  Created by alexchoi1 on 7/30/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "MudkipAnnotationView.h"

@implementation MudkipAnnotationView
{
    UIImageView * imageView;
}
@synthesize pictureString;
//@synthesize customAnnotation;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self)
    {

        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(-20,-20,40,40)];
        imageView.image = [UIImage imageNamed:@"mudkipSmall"];
     
        NSNotificationCenter * notificationCenter =        [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(changeImage:) name:@"changeImage" object:nil];
        
        [self addSubview:imageView];
    }
    
    return self;
}

-(void) changeImage: (NSNotification *) notification
{

    UIImage * chosenImage = notification.object;
    
    imageView.image = chosenImage;

   // NSLog(@"%@",notification.object);
}

-(void) dealloc
{
    NSNotificationCenter * notificationCenter =        [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
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
