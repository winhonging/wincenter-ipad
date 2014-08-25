//
//  DatacenterDetailVC.h
//  wincenterDemo01
//
//  Created by huadi on 14-8-15.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatacenterDetailPageVC.h"
@class  DatacenterDetailPageVC;
@interface DatacenterDetailInfoVC : UIViewController
@property DatacenterDetailPageVC *pageVC;
- (void)switchButtonSelected:(int)index;
@end
