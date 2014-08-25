//
//  DatacenterMainPageVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-20.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "DatacenterDetailPageVC.h"

@interface DatacenterDetailPageVC ()

@property NSArray *pages;
@property NSInteger _selectedIndex;
@property int previousIndex;
@property int showIndex;
@end

@implementation DatacenterDetailPageVC

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
    
    
    self.pages = @[
        [self.storyboard instantiateViewControllerWithIdentifier:@"PoolCollectionVC"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"HostCollectionVC"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"StorageCollectionVC"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"VmCollectionVC"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"BusinessCollectionVC"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"NetworkMainVC"]
    ];
    self.previousIndex = 0;
    self.showIndex = 0;
    [self setViewControllers:@[self.pages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.dataSource = self;
    self.delegate = self;
}
-(void)switchPageVC:(int)index{
    self.showIndex = index;
    [self setViewControllers:@[self.pages[index]] direction:(index>self.previousIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse) animated:YES completion:nil];
    self.previousIndex = index;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.pages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }else{
        index--;
        return self.pages[index];
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.pages indexOfObject:viewController];
    if (index == self.pages.count - 1) {
        return nil;
    }else{
        index++;
        return self.pages[index];
    }
    
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return self.pages.count;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return self.showIndex;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    self._selectedIndex = [self.pages indexOfObject:pendingViewControllers[0]];
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if(completed){
        self.showIndex = self._selectedIndex;
        [self.detailVC switchButtonSelected:self._selectedIndex];
    }
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
