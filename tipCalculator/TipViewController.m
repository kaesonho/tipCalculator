//
//  ViewController.m
//  tipCalculator
//
//  Created by Kaeson Ho on 1/19/17.
//  Copyright © 2017 Kaeson Ho. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateUIBySetting];
    [self updateValue];
    [self.billTextField becomeFirstResponder];
    self.billTextField.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)viewWillAppear:(BOOL)animated {

}

- (void)viewDidAppear:(BOOL)animated {
    [self updateUIBySetting];
    [self updateValue];
    [self.billTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    // NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    // NSLog(@"view did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValue];
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValue];
}
- (IBAction)onBillChanged:(id)sender {
    [self updateValue];
    NSLog(@"??dd?");
}
- (IBAction)onBillEdited:(id)sender {
    [self updateValue];
    NSLog(@"???");
}
- (IBAction)onBillEditingChanged:(id)sender {
    NSLog(@"???");
    [self updateValue];
}

- (void)updateValue {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void) updateUIBySetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    bool isDark =[defaults boolForKey:@"theme"];
    long defaultTip = [defaults integerForKey:@"default_tip"];
    self.tipControl.selectedSegmentIndex = defaultTip;
    if (isDark) {
        self.view.backgroundColor = [UIColor colorWithRed:73.0/255.0f green:106.0/255.0f blue:131.0/255.0f alpha:1.0];
    } else {
        self.view.backgroundColor = [UIColor colorWithRed:143.0/255.0f green:183.0/255.0f blue:213.0/255.0f alpha:1.0];
    }
}

@end
