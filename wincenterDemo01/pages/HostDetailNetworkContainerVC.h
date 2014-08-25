//
//  HostDetailNetworkContainerVC.h
//  wincenterDemo01
//
//  Created by huadi on 14-8-18.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HostDetailNetworkPageVC.h"

@interface HostDetailNetworkContainerVC : UIViewController

@property HostDetailNetworkPageVC *pageVC;
@property (weak, nonatomic) IBOutlet UIView *insideContainer;
@property (weak, nonatomic) IBOutlet UISegmentedControl *HostDetailNetworkSegmented;

@end
