//
//  HostCollectionVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-15.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "HostCollectionVC.h"
#import "HostCollectionCell.h"
#import "HostCollectionHeader.h"
#import "HostCollectionFooter.h"

@interface HostCollectionVC ()

@end

@implementation HostCollectionVC

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
    self.collectionView.backgroundColor = [UIColor clearColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.isFullPage){
        return 9;
    }else{
        return 3;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HostCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HostCollectionCell" forIndexPath:indexPath];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(self.isFullPage){
        return 1;
    }else{
        return 3;
    }
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        HostCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HostCollectionHeader" forIndexPath:indexPath];

        return header;
    }else{
        HostCollectionFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HostCollectionFooter" forIndexPath:indexPath];
        return footer;
    }

}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

   // HostCollectionFooter *footer = [collectionView dequeueReusableCellWithReuseIdentifier:@"HostCollectionFooter" forIndexPath:indexPath];
   // return footer;
                                                                                                                                                
                                                                                                            
//}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString: @"toVmCollectionVC"]){
//        self.collectionView.hidden = YES;
//    }
//}
//
//- (IBAction)backToHostList:(UIStoryboardSegue*)segue{
//    self.collectionView.hidden = NO;
//}

@end
