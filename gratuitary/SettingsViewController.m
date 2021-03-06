//
//  SettingsViewController.m
//  gratuitary
//
//  Created by Steve Mitchell on 10/2/15.
//  Copyright (c) 2015 Steve Mitchell. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *greatTipValue;
@property (weak, nonatomic) IBOutlet UISlider *greatTipControl;
@property (weak, nonatomic) IBOutlet UILabel *averageTipValue;
@property (weak, nonatomic) IBOutlet UISlider *averageTipControl;
@property (weak, nonatomic) IBOutlet UILabel *poorTipValue;
@property (weak, nonatomic) IBOutlet UISlider *poorTipControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *roundControl;
@property (weak, nonatomic) IBOutlet UILabel *roundingInfo;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long greatTipValue = 20;
    if ([defaults integerForKey:@"greatTipValue"]) {
        greatTipValue = [defaults integerForKey:@"greatTipValue"];
    }
    else {
        [defaults setInteger:greatTipValue forKey:@"greatTipValue"];
    }
    
    long averageTipValue = 15;
    if ([defaults integerForKey:@"averageTipValue"]) {
        averageTipValue = [defaults integerForKey:@"averageTipValue"];
    }
    else {
        [defaults setInteger:averageTipValue forKey:@"averageTipValue"];
    }
    
    long poorTipValue = 10;
    if ([defaults integerForKey:@"poorTipValue"]) {
        poorTipValue = [defaults integerForKey:@"poorTipValue"];
    }
    else {
        [defaults setInteger:poorTipValue forKey:@"poorTipValue"];
    }
    
    //NSLog([NSString stringWithFormat:@"%li %@", greatTipValue, @"%"]);
    [self.greatTipControl setValue:greatTipValue animated:(NO)];
    self.greatTipValue.text = [NSString stringWithFormat:@"%li%@", greatTipValue, @"%"];
    
    [self.averageTipControl setValue:averageTipValue animated:(NO)];
    self.averageTipValue.text = [NSString stringWithFormat:@"%li%@", averageTipValue, @"%"];
    
    [self.poorTipControl setValue:poorTipValue animated:(NO)];
    self.poorTipValue.text = [NSString stringWithFormat:@"%li%@", poorTipValue, @"%"];
    
    long roundUp = [defaults integerForKey:@"roundUp"];
    [self setRoundValue:roundUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onGreatTipValueChanged:(UISlider *)sender {
    long greatTipValue = floor(self.greatTipControl.value);
    self.greatTipValue.text = [NSString stringWithFormat:@"%li%@", greatTipValue, @"%"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:greatTipValue forKey:@"greatTipValue"];
}

- (IBAction)onAverageTipValueChanged:(UISlider *)sender {
    long averageTipValue = floor(self.averageTipControl.value);
    self.averageTipValue.text = [NSString stringWithFormat:@"%li%@", averageTipValue, @"%"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:averageTipValue forKey:@"averageTipValue"];
}

- (IBAction)onPoorTipValueChanged:(UISlider *)sender {
    long poorTipValue = floor(self.poorTipControl.value);
    self.poorTipValue.text = [NSString stringWithFormat:@"%li%@", poorTipValue, @"%"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:poorTipValue forKey:@"poorTipValue"];
}

- (IBAction)onRoundValueChanged:(UISegmentedControl *)sender {
    [self setRoundValue:sender.selectedSegmentIndex];
}

- (void)setRoundValue:(long) roundValue {
    [self.roundControl setSelectedSegmentIndex:roundValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:roundValue forKey:@"roundUp"];
    
    NSArray *roundingInfos = @[@"",
                               @"The tip will round up to the nearest dollar amount, so you don't have to give the server change.",
                               @"The tip will round up so the total is an even dollar amount.  You won't need to carry change around."];
    self.roundingInfo.text = roundingInfos[roundValue];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
