//
//  DatacenterMainPageVC.h
//  wincenterDemo01
//
//  Created by huadi on 14-8-20.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatacenterDetailInfoVC.h"

@class DatacenterDetailInfoVC;

@interface DatacenterDetailPageVC : UIPageViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property DatacenterDetailInfoVC *detailVC;

-(void)switchPageVC:(int)index;
@end
