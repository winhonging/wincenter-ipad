//
//  PoolDetailVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-18.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "PoolDetailPageVC.h"

@interface PoolDetailPageVC ()

@property NSArray *poolDetailPages;

@end

@implementation PoolDetailPageVC

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
    self.poolDetailPages = @[
        [self.storyboard instantiateViewControllerWithIdentifier:@"PoolDetailBaseinfo"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"PoolDetailHost"],
        [self.storyboard instantiateViewControllerWithIdentifier:@"StorageCollectionVCFull"]
    ];
    [self setViewControllers:@[self.poolDetailPages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.dataSource = self;
    self.delegate = self;
//    for(UIView *subview in self.view.subviews){
//        if([subview isKindOfClass:[UIScrollView class]]){
//             ((UIScrollView *)subview).pagingEnabled = false;
//        }
//    }
   

}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.poolDetailPages indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }else{
        index--;
        return self.poolDetailPages[index];
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index =  [self.poolDetailPages indexOfObject:viewController];
    if (index == self.poolDetailPages.count - 1) {
        return nil;
    }else{
        index++;
        return self.poolDetailPages[index];
    }
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return self.poolDetailPages.count;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
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
