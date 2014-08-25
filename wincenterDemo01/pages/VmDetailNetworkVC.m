//
//  VmDetailNetworkVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-19.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "VmDetailNetworkVC.h"
#import "VmDetailNetworkCell.h"
#import "VmDetailNetworkHeader.h"
#import "VmDetailNetworkFooter.h"

@interface VmDetailNetworkVC ()

@end

@implementation VmDetailNetworkVC

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
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VmDetailNetworkCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VmDetailNetworkCell" forIndexPath:indexPath];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
        VmDetailNetworkHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"VmDetailNetworkHeader" forIndexPath:indexPath];
        return header;
    }else{
        VmDetailNetworkFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"VmDetailNetworkFooter" forIndexPath:indexPath];
        return footer;
    }
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
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
