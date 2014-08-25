//
//  VmDetailBaseinfoVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-19.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "VmDetailPageVC.h"

@interface VmDetailPageVC ()

@property NSArray *vmDetailPages;

@end

@implementation VmDetailPageVC

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
    self.vmDetailPages = @[
                [self.storyboard instantiateViewControllerWithIdentifier:@"VmDetailBaseinfo"],
                [self.storyboard instantiateViewControllerWithIdentifier:@"VmDetailPerformance"],
                [self.storyboard instantiateViewControllerWithIdentifier:@"VmDetailSnapshoot"]
    ];
    [self setViewControllers:@[self.vmDetailPages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.dataSource = self;
    self.delegate = self;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.vmDetailPages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }else{
        index--;
        return self.vmDetailPages[index];
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.vmDetailPages indexOfObject:viewController];
    if (index == self.vmDetailPages.count - 1) {
        return nil;
    }else{
        index++;
        return self.vmDetailPages[index];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
