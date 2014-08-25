//
//  DatacenterMainVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-15.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "DatacenterContainerVC.h"


@interface DatacenterContainerVC ()

@end

@implementation DatacenterContainerVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pageVC.detailVC = self.detailVC;
    self.detailVC.pageVC = self.pageVC;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toDatacenterPageVC"]){
        self.pageVC = segue.destinationViewController;
    }else if([segue.identifier isEqualToString:@"toDatacenterDetailVC"]){
        self.detailVC = segue.destinationViewController;
    }
}

@end
