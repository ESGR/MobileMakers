//
//  ViewController.m
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//


/*
 1. Change the color of a view
 2. Change the dimensions/position of a view
 3. Toggle the Button label
 4. Use a UIImageView
 5. Use a UISlider to change the float value in a UILabel
 */

#import "ViewController.h"

@interface ViewController ()

{

    __weak IBOutlet UIButton *buttonChangedColor;
    
    
    
    __weak IBOutlet UIButton *secondButton;
    
    
    __weak IBOutlet UIButton *onOffButtonLabel;
    
    __weak IBOutlet UIImageView *mobileMakersLogo;
    
    
    __weak IBOutlet UISlider *sliderValue;
    
    __weak IBOutlet UILabel *sliderLabel;
    
    UIImage         *mMBlackWhite;
    UIImage         *mMColor;
    
    
    __weak IBOutlet UITextField *firstNumberBox;
    
    __weak IBOutlet UITextField *secondNumberBox;
 
    __weak IBOutlet UILabel *numberAnswer;
    
    
    
}


- (IBAction)onOffButton:(id)sender;

- (IBAction)logoColorChanger:(id)sender;

- (IBAction)sliderAction:(id)sender;

- (IBAction)mathButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    buttonChangedColor.titleLabel.backgroundColor = [UIColor redColor];
     buttonChangedColor.backgroundColor = [UIColor redColor];
    [secondButton setFrame:CGRectMake(10, 100, 300, 50)];
    mMBlackWhite = [UIImage imageNamed:@"MobileMakersLogo_black_and_white.png"];
    mMColor = [UIImage imageNamed:@"MobileMakersLogo_color.png"];
    [mobileMakersLogo setImage:mMBlackWhite];
    sliderLabel.text = [NSString stringWithFormat: @"%f",.5];
    

    
}


- (IBAction)onOffButton:(id)sender {
    if ([onOffButtonLabel.titleLabel.text isEqual: @"On"])
    {
    [onOffButtonLabel setTitle:@"Off" forState:UIControlStateNormal];
    }
    
    else
    {
        [onOffButtonLabel setTitle:@"On" forState:UIControlStateNormal];
    }
}

- (IBAction)logoColorChanger:(id)sender {
    
    
    
    if (mobileMakersLogo.image == mMBlackWhite)
    {
    [mobileMakersLogo setImage:mMColor];
    }
    
    else
    {
        [mobileMakersLogo setImage:mMBlackWhite];
    }
    
    
}

- (IBAction)sliderAction:(id)sender {
    
    
    sliderLabel.text = [NSString stringWithFormat: @"%f", sliderValue.value];
    
    
}

- (IBAction)mathButton:(id)sender {
    
    numberAnswer.text = [NSString stringWithFormat:@"%i", [firstNumberBox.text intValue] + [secondNumberBox.text intValue]];
    [self.view endEditing:YES];
    
    
}
@end
