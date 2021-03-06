//
//  ViewController.m
//  gratuitary
//
//  Created by Steve Mitchell on 10/2/15.
//  Copyright (c) 2015 Steve Mitchell. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTipOptions];
    [self updateTipValues];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.billTextField becomeFirstResponder];
    [self updateTipOptions];
    [self updateTipValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTipPercentChanged:(UISegmentedControl *)sender {
    [self updateTipValues];
}
- (IBAction)onBillValueChanged:(UITextField *)sender {
    [self updateTipValues];
}
- (void)updateTipValues {
    //get the bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // compute the tip and total
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long greatTipValue = [defaults integerForKey:@"greatTipValue"];
    long averageTipValue = [defaults integerForKey:@"averageTipValue"];
    long poorTipValue = [defaults integerForKey:@"poorTipValue"];
    long roundUp = [defaults integerForKey:@"roundUp"] ? roundUp = [defaults integerForKey:@"roundUp"] : 0;
    
    NSArray *tipPercentages = @[@(greatTipValue), @(averageTipValue), @(poorTipValue)];
    
    float tipAmount = billAmount * ([tipPercentages[self.tipControl.selectedSegmentIndex] floatValue]/100);
    //round the tip amount to the nearest dollar
    if (roundUp == 1) {
        //to correct for float precision errors, numbers within 1 penny of the floor with round down.
        tipAmount = floor(tipAmount + 0.994);
    }
    //increase the tip amount to bring the total to the nearest dollar.
    else if(roundUp == 2){
        float distance = 1.00 - fmodf((billAmount + tipAmount), 1.0);
        // distance is a positive number between 0 and 1.00;
        tipAmount = tipAmount + fmodf(distance, 1.00);
    }

    float totalAmount = billAmount + tipAmount;
    
    //updat the label
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)updateTipOptions {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long greatTipValue = [defaults integerForKey:@"greatTipValue"] ? [defaults integerForKey:@"greatTipValue"] : 20;
    long averageTipValue = [defaults integerForKey:@"averageTipValue"] ? [defaults integerForKey:@"averageTipValue"] : 15;
    long poorTipValue = [defaults integerForKey:@"poorTipValue"] ? [defaults integerForKey:@"poorTipValue"] : 10;
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%li%@", greatTipValue, @"%"] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%li%@", averageTipValue, @"%"] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%li%@", poorTipValue, @"%"]forSegmentAtIndex:2];
}

@end
