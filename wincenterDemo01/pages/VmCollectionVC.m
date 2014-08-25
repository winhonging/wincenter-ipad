//
//  VmCollectionVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-18.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "VmCollectionVC.h"
#import "VmCollectionCell.h"
#import "VmCollectionHeader.h"
#import "VmCollectionFooter.h"

@interface VmCollectionVC ()

@end

@implementation VmCollectionVC


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
    if(self.isForBusiness){
        return 12;
    }
    else if(self.isFullPage){
        return 9;
    }else{
        return 3;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VmCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VmCollectionCell" forIndexPath:indexPath];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(self.isForBusiness){
        return 1;
    }
    else if(self.isFullPage){
        return 1;
    }else{
        return 3;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
        VmCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"VmCollectionHeader" forIndexPath:indexPath];
        return header;
    }else{
        VmCollectionFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"VmCollectionFooter" forIndexPath:indexPath];
        return footer;
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
- (IBAction)bacAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
