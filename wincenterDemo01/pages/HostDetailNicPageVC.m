//
//  HostDetailNicPageVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-19.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "HostDetailNicPageVC.h"
#import "HostDetailNicContainerVC.h"

@interface HostDetailNicPageVC ()

@property NSArray *HostDetailNicPages;
@property NSInteger _selectedIndex;
@property int previousIndex;
@end

@implementation HostDetailNicPageVC

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
    
    self.HostDetailNicPages = @[
                                    [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailNicInside"],
                                    [self.storyboard instantiateViewControllerWithIdentifier:@"HostDetailNicOutside"]
                                    
                                    ];
    self.previousIndex = 0;
    [self setViewControllers:@[self.HostDetailNicPages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.dataSource = self;
    self.delegate = self;
    
}

-(void) switchVC:(int)index{
    
    [self setViewControllers:@[self.HostDetailNicPages[index]] direction:(index>self.previousIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse) animated:YES completion:nil];
    self.previousIndex = index;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.HostDetailNicPages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }else{
        index--;
        return self.HostDetailNicPages[index];
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.HostDetailNicPages indexOfObject:viewController];
    if (index == self.HostDetailNicPages.count - 1) {
        return nil;
    }else{
        index++;
        return self.HostDetailNicPages[index];
    }
    
}
//控制是否出圆点切换
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
//    return self.HostDetailNicPages.count;
//}
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    return 0;
//}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    self._selectedIndex = [self.HostDetailNicPages indexOfObject:pendingViewControllers[0]];
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if(completed){
        ((HostDetailNicContainerVC*)self.parentViewController).HostDetailNicSegmented.selectedSegmentIndex = self._selectedIndex;
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
