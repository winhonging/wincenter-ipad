//
//  StorageCollectionVC.m
//  wincenterDemo01
//
//  Created by huadi on 14-8-18.
//  Copyright (c) 2014年 huadi. All rights reserved.
//

#import "StorageCollectionVC.h"
#import "StorageCollectionCell.h"
#import "StorageCollectionHeader.h"
#import "StorageCollectionFooter.h"

@interface StorageCollectionVC ()

@end

@implementation StorageCollectionVC

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
        return 12;
    }else{
        return 3;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StorageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StorageCollectionCell" forIndexPath:indexPath];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
        StorageCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"StorageCollectionHeader" forIndexPath:indexPath];
        return header;
    }else{
        StorageCollectionFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"StorageCollectionFooter" forIndexPath:indexPath];
        return footer;
    }
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if(self.isFullPage){
        return 1;
    }else{
        return 3;
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
