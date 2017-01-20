//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Kaeson Ho on 1/20/17.
//  Copyright © 2017 Kaeson Ho. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *DefaultTipSetting;
@property (weak, nonatomic) IBOutlet UISwitch *ThemeSetting;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *TapController;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUIBySetting];
}

-(void) viewDidAppear:(BOOL)animated {
    [self updateUIBySetting];
}

- (IBAction)onDefaultTipChange:(id)sender {
    [self updateSetting];
}

- (IBAction)onThemeChange:(id)sender {
    [self updateSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void) updateUIBySetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    bool isDark =[defaults boolForKey:@"theme"];
    long defaultTip = [defaults integerForKey:@"default_tip"];
    self.DefaultTipSetting.selectedSegmentIndex = defaultTip;
    [self.ThemeSetting setOn:isDark];
}

- (void)updateSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float defaultTip = self.DefaultTipSetting.selectedSegmentIndex;
    bool isDark = self.ThemeSetting.isOn;
    NSLog(@"theme: %d", isDark);
    [defaults setInteger:defaultTip forKey:@"default_tip"];
    [defaults setBool:isDark forKey:@"theme"];
    [defaults synchronize];
}

@end
