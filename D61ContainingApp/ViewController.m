//
//  ViewController.m
//  D61ContainingApp
//
//  Created by Rommel Rico on 2/19/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

#import "ViewController.h"
@import Social;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation ViewController

- (IBAction)doPostingToTwitter:(id)sender {
    //NOTE: Alternative API to do non-GUI postings.
    //SLRequest, etc.
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        //[[[UIAlertView alloc]initWithTitle:@"Service" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        vc.completionHandler = ^(SLComposeViewControllerResult result) {
            //NOTE: Runs on separate thread.
            NSString *s;
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    s = @"Result Cancelled";
                    break;
                case SLComposeViewControllerResultDone:
                    s = @"Result Done";
                    break;
                default:
                    break;
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.myTextField.text = s;
            }];
        };
        
        //Initialize the Twitter posting.
        [vc setInitialText:self.myTextField.text];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
