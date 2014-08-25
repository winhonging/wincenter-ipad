//
//  HostDetailVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-18.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "HostDetailPageVC.h"

@interface HostDetailPageVC ()

@property NSArray *HostDetailPages;

@end

@implementation HostDetailPageVC

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
    self.HostDetailPages = @[
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailBaseinfo"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailPerformance"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"StorageCollectionVCFull"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailNetwork"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailNic"]
    ];
    [self setViewControllers:@[self.HostDetailPages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.dataSource = self;
    self.delegate = self;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.HostDetailPages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }else{
        index--;
        return self.HostDetailPages[index];
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.HostDetailPages indexOfObject:viewController];
    if (index == self.HostDetailPages.count - 1) {
        return nil;
    }else{
        index++;
        return self.HostDetailPages[index];
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
