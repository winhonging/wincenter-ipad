//
//  HostDetailNetworkContainerVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-18.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "HostDetailNetworkContainerVC.h"

@interface HostDetailNetworkContainerVC ()

@end

@implementation HostDetailNetworkContainerVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)HostDetailNetworkChange:(id)sender {
//    if ([self.HostDetailNetworkSegmented selectedSegmentIndex] == 0) {
//        self.insideContainer.hidden = NO;
//        self.outsideContainer.hidden = YES;
//    }
//    else{
//        self.insideContainer.hidden = YES;
//        self.outsideContainer.hidden = NO;
//    }
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor clearColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentAction:(id)sender {
    [self.pageVC switchVC:self.HostDetailNetworkSegmented.selectedSegmentIndex];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toHostDetailNetworkPageVC"]){
        self.pageVC = segue.destinationViewController;
    }
}


@end
