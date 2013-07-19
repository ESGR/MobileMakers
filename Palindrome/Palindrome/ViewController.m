//
//  ViewController.m
//  Palindrome
//
//  Created by Don Bora on 4/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *inputTextField;
    __weak IBOutlet UILabel *resultLabel;
    
    int result;
}
- (IBAction)check:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showIsPalindrone
{
    resultLabel.text = @"Is a palindrone!";
}

-(void)showIsNotPalindrone
{
    resultLabel.text = @"NOT a palindrone!";
}


-(const char*)getCharacterArray
{
    return [inputTextField.text UTF8String];
}


-(void)showResult
{
    resultLabel.text = [NSString stringWithFormat:@"%i", result];
}


-(void)checkForPalindrome
{
    const char* arrayOfCharacters = [self getCharacterArray];
    BOOL isPalindrome = NO;
    ///
    
    
    
    int arraylength = strlen(arrayOfCharacters);
    
    for (int i=0; i<arraylength/2; i++)
    {
        if(
        arrayOfCharacters[i ] == arrayOfCharacters[arraylength-i-1]
           )
        {isPalindrome = YES;}
        else
        { isPalindrome = NO;
            break;
           }
        
    }
    
    
    // Insert code in here to check the characters of the array for palindronishness
    
    
    
    ///count chars in array
    ///compare array[i] == array [length-i]
    ///compare first to last
    ///compare first +1 to last-1
    ///loop
    ///if loop completes, bool = YES
    
    
    
    
    
    
    if (isPalindrome) {
        [self showIsPalindrone];
    }
    else{
        [self showIsNotPalindrone];
    }    
////test if arrayOfCharacters is in fact an array of characters
    ///NSLog(@"%s",arrayOfCharacters);
   /// NSLog(@"%i",isPalindrome);
    
     }

    
-(void)sumIntegers
{
    const char* arrayOfCharacters = [self getCharacterArray];
    
    int stringSum = 0;
    int stringLength = strlen(arrayOfCharacters);
    const char* zero = "0";
    
    for (int i=0; i<stringLength; i++) {
        if (i % 2 == 0 )
        { stringSum = stringSum + arrayOfCharacters[i]-zero[0];
            NSLog(@"%i",stringSum);}
        
        result = stringSum;
        
        ///mvp only works with single digit ints
        [self showResult];
    }
}

    -(IBAction)check:(id)sender
    {
        //[self checkForPalindrome];
        
        // Uncomment the following line of code and comment out the previous line of code to run summation
        [self sumIntegers];
    }
    @end
