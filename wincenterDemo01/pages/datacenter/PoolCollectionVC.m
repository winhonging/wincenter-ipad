//
//  PoolCollectionVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-15.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "PoolCollectionVC.h"
#import "PoolCollectionCell.h"
#import "PoolCollectionHeader.h"
#import "PoolCollectionFooter.h"

@interface PoolCollectionVC ()

@end

@implementation PoolCollectionVC

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
    return 12;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PoolCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PoolCollectionCell" forIndexPath:indexPath];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        PoolCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PoolCollectionHeader" forIndexPath:indexPath];
        
        return header;
    }else{
        PoolCollectionFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"PoolCollectionFooter" forIndexPath:indexPath];
        return footer;
    }
    
}

-(IBAction)gobackToPool:(UIStoryboardSegue *)segue{}
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
