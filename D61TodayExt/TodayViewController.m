//
//  TodayViewController.m
//  D61TodayExt
//
//  Created by Rommel Rico on 2/19/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property int count;

@end

@implementation TodayViewController

- (IBAction)doButton:(id)sender {
    [self updateDisplay];
}

- (void)updateDisplay {
    self.count++;
    self.myLabel.text = [NSString stringWithFormat:@"Count = %i", self.count];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    [self updateDisplay];
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

//- (void)viewDidAppear:(BOOL)animated {
//    NSLog(@"We appeared");
//    self.count++;
//    [self updateDisplay];
//}

//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    if (!self.hasSignaled) [self signalComplete:NCUpdateResultFailed];
//}

//- (void)signalComplete:(NCUpdateResult)updateResult {
//    NSLog(@"Signaling complete: %lu", updateResult);
//    self.hasSignaled = YES;
//    if (self.completionHandler) self.completionHandler(updateResult);
//}

@end
