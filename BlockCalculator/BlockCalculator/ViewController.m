//
//  ViewController.m
//  BlockCalculator
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "MathLogic.h"

///declare new type mathType. mathType is a block. block type def is different from other typedefs.

///typedef NSInteger (^mathType) (NSInteger,NSInteger);

///mathType is our new type. This type is a block that takes in 2 NSIntegers and returns 1 NSInteger

/*
 mathType add = ^(NSInteger int1, NSInteger int2)
 {
 return int1 + int2;
 };
 
 ///mathtype add (block that takes in two NSIntegers and returns 1) takes in the two NSIntegers and returns the sum
 
 mathType subtract = ^(NSInteger int1, NSInteger int2)
 {
 return int1 - int2;
 };
 
 ///mathtype add (block that takes in two NSIntegers and returns 1) takes in the two NSIntegers and returns the sum
 */
/*
 NSInteger (^add) (NSInteger,NSInteger) = ^(NSInteger int1, NSInteger int2)
 {
 
 return int1+int2;
 
 };
 */

/*
 NSInteger add (int int1, int int2)
 {
 return int1+int2;
 }
 */
@interface ViewController ()
{
    
    __weak IBOutlet UITextField *textField1;
    __weak IBOutlet UITextField *textField2;
    __weak IBOutlet UILabel *label;
    MathLogic * mathLogic;
    
}
- (IBAction)calculate:(id)sender;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
  mathLogic = [[MathLogic alloc] init];
    
    /*
    mathLogic.add = ^(NSInteger int1, NSInteger int2)
    {
        return int1 + int2;
    };
    
    mathLogic.subtract = ^(NSInteger int1, NSInteger int2)
    {
        return int1 - int2;
    };
    
    mathLogic.multiply = ^(NSInteger int1, NSInteger int2)
    {
        return int1 * int2;
    };
    
    mathLogic.divide = ^(NSInteger int1, NSInteger int2)
    {
        return int1 / int2;
    };

        NSLog(@"%@",mathLogic);
       NSLog(@"%@",mathLogic.add);
	*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) calculateNumber: (NSInteger) int1 toNumber: (NSInteger) int2 usingBlock: (NSInteger (^) (NSInteger,NSInteger)) mathBlock
{
    return mathBlock(int1,int2);
}



- (IBAction)calculate:(UIButton *)sender
{
    NSInteger newNumber;
    if (sender.tag == 0)
    {
        
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:mathLogic.add];
        
        
    }
    else if (sender.tag == 1 )
    {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:mathLogic.subtract];
    }
    else if (sender.tag == 2 )
    {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:mathLogic.multiply];}
    else
    {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:mathLogic.divide];}
    
    
    
    
    ///NSInteger newNumber = add(textField1.text.intValue, textField2.text.intValue);
    
    
    
    label.text = [NSString stringWithFormat:@"%i",newNumber];
    
    /*
     [UIView animateWithDuration:10.0 animations:^{
     self.view.backgroundColor = [UIColor blackColor];
     
     }
     completion:^(BOOL finished) {
     NSLog(@"animation finished");
     }];
     */
    
}
/*

- (IBAction)calculate:(UIButton *)sender
{
    NSInteger newNumber;
    if (sender.tag == 0)
    {
        
         newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
                     {
                         return int1+int2;
                     }];
     
    }
    else if (sender.tag == 1 )
    {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
                     {
                         return int1-int2;
                     }];}
    else if (sender.tag == 2 )
    {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
                     {
                         return int1*int2;
                     }];}
    else 
    {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2)
                     {
                         return int1/int2;
                     }];}
    
    


///NSInteger newNumber = add(textField1.text.intValue, textField2.text.intValue);



label.text = [NSString stringWithFormat:@"%i",newNumber];

    
[UIView animateWithDuration:10.0 animations:^{
    self.view.backgroundColor = [UIColor blackColor];
    
}
                 completion:^(BOOL finished) {
                     NSLog(@"animation finished");
                 }]; 
     

}
*/



@end
