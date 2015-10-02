//
//  ViewController.m
//  tipCalculator
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
@property (weak, nonatomic) IBOutlet UISwitch *roundControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTipOptions];
    [self updateTipValues];
}
- (void)viewWillAppear:(BOOL)animated {
    [self updateTipOptions];
    [self updateTipValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
- (IBAction)onTipPercentChanged:(UISegmentedControl *)sender {
    [self updateTipValues];
}
- (IBAction)onBillValueChanged:(UITextField *)sender {
    [self updateTipValues];
}
- (IBAction)onRoundChanged:(UISwitch *)sender {
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
    
    NSArray *tipPercentages = @[@(greatTipValue), @(averageTipValue), @(poorTipValue)];
    
    float tipAmount = billAmount * ([tipPercentages[self.tipControl.selectedSegmentIndex] floatValue]/100);
    if (self.roundControl.on) {
        //to correct for float precision errors, numbers within 1 penny of the floor with round down.
        tipAmount = floor(tipAmount + 0.994);
    }
    float totalAmount = billAmount + tipAmount;
    
    //updat the label
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)updateTipOptions {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long greatTipValue = [defaults integerForKey:@"greatTipValue"];
    long averageTipValue = [defaults integerForKey:@"averageTipValue"];
    long poorTipValue = [defaults integerForKey:@"poorTipValue"];
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%li%@", greatTipValue, @"%"] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%li%@", averageTipValue, @"%"] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%li%@", poorTipValue, @"%"]forSegmentAtIndex:2];
}

@end
