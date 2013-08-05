//
//  subView1.m
//  NotificationFun
//
//  Created by alexchoi1 on 7/31/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "subView1.h"
#import "UIColor+colorFromString.h"

@implementation subView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(changeColor:) name:@"ChangeColor" object:nil];
    }
    return self;
}

-(void) changeColor: (NSNotification *) notification
{
    NSString *    colorText;
    colorText = [notification.userInfo objectForKey:@"color"];
    
    if ([UIColor colorFromString:colorText])
    {
        self.backgroundColor =  [UIColor colorFromString:colorText];
    }
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
