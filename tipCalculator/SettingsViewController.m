//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Steve Mitchell on 10/2/15.
//  Copyright (c) 2015 Steve Mitchell. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *greatTipValue;
@property (weak, nonatomic) IBOutlet UISlider *greatTipControl;

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
    //NSLog([NSString stringWithFormat:@"%li %@", greatTipValue, @"%"]);
    [self.greatTipControl setValue:greatTipValue animated:(NO)];
    self.greatTipValue.text = [NSString stringWithFormat:@"%li%@", greatTipValue, @"%"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onGreatTipValueChanged:(UISlider *)sender {
    long greatTipValue = floor(self.greatTipControl.value);
    self.greatTipValue.text = [NSString stringWithFormat:@"%li", greatTipValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:greatTipValue forKey:@"greatTipValue"];
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
