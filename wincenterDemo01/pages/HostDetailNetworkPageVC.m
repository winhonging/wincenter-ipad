//
//  HostDetailNetworkPageVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-19.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "HostDetailNetworkPageVC.h"
#import "HostDetailNetworkContainerVC.h"

@interface HostDetailNetworkPageVC ()

@property NSArray *HostDetailNetworkPages;
@property NSInteger _selectedIndex;
@property int previousIndex;
@end

@implementation HostDetailNetworkPageVC

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
    
    self.HostDetailNetworkPages = @[
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailNetworkInside"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailNetworkOutside"]
                             
        ];
     self.previousIndex = 0;
    [self setViewControllers:@[self.HostDetailNetworkPages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];

    self.dataSource = self;
    self.delegate = self;

}

-(void) switchVC:(int)index{
    
    [self setViewControllers:@[self.HostDetailNetworkPages[index]] direction:(index>self.previousIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse) animated:YES completion:nil];
    self.previousIndex = index;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.HostDetailNetworkPages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }else{
        index--;
        return self.HostDetailNetworkPages[index];
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.HostDetailNetworkPages indexOfObject:viewController];
    if (index == self.HostDetailNetworkPages.count - 1) {
        return nil;
    }else{
        index++;
        return self.HostDetailNetworkPages[index];
    }
    
}
//控制是否出圆点切换
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
//    return self.HostDetailNetworkPages.count;
//}
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    return 0;
//}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    self._selectedIndex = [self.HostDetailNetworkPages indexOfObject:pendingViewControllers[0]];
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if(completed){
        ((HostDetailNetworkContainerVC*)self.parentViewController).HostDetailNetworkSegmented.selectedSegmentIndex = self._selectedIndex;
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
