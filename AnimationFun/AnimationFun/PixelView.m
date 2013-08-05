//
//  PixelView.m
//  AnimationFun
//
//  Created by alexchoi1 on 8/1/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "PixelView.h"

@implementation PixelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  //  UITouch *touch = [touches anyObject];
 //   CGPoint point = [touch locationInView:self.superview];
    
    NSInteger xCoordinate = arc4random() % ((int)self.superview.frame.size.width - (int)self.frame.size.width)+.5*self.frame.size.width;
    NSInteger yCoordinate = arc4random() % ((int)self.superview.frame.size.height - (int)self.frame.size.height)+.5*self.frame.size.height;
    [UIView animateWithDuration:1 animations:^{
        self.center = CGPointMake(xCoordinate,yCoordinate);
        self.backgroundColor = [UIColor redColor];
               
    } completion:^(BOOL finished) {
        self.backgroundColor = [UIColor whiteColor];
        
        NSLog(@"%f %f", self.center.x, self.center.y);

    }   ];
    
    //limit 270 and 500
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
