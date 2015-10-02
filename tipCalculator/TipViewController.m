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
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
- (IBAction)onTipPercentChanged:(UISegmentedControl *)sender {
    [self updateValues];
}
- (IBAction)onBillValueChanged:(UITextField *)sender {
    [self updateValues];
}
- (void)updateValues {
    //get the bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // compute the tip and total
    float tipPercentage = (.15 + (self.tipControl.selectedSegmentIndex * .05));
    float tipAmount = billAmount * tipPercentage;
    if (self.roundControl.on) {
        tipAmount = ceil(tipAmount);
    }
    float totalAmount = billAmount + tipAmount;
    
    //updat the label
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
