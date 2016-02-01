//
//  OrderViewController.m
//  mStore
//
//  Created by Cihangir Sungur on 1/29/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "OrderViewController.h"
#import "ProceedOrderViewController.h"

@interface OrderViewController ()

@property (nonatomic, strong) IBOutlet UICollectionView *orderCollectionView;
@property (nonatomic, strong) IBOutlet UIButton *proceedOrderButton;

@end

@implementation OrderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Order";
    
    [self.orderCollectionView registerNib:[UINib nibWithNibName:@"OrderCell" bundle:nil] forCellWithReuseIdentifier:@"ORDERCELL"];
    
    if ([[[StoreNetworkManager sharedManager] orderDataAray] count] == 0)
    {
        [self.proceedOrderButton setHidden:YES];
    }
}

#pragma mark - UICollectionViewDelegate methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[StoreNetworkManager sharedManager] orderDataAray] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OrderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ORDERCELL" forIndexPath:indexPath];
    
    NSMutableArray *orderDataArray = [[StoreNetworkManager sharedManager] orderDataAray];
    
    [cell setOrderModel:[orderDataArray objectAtIndex:indexPath.item]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 93);
}

#pragma mark - Actions

- (IBAction)proceedOrderButtonTapped:(id)sender
{
    ProceedOrderViewController *proceedOrderVC = [[ProceedOrderViewController alloc] init];
    [self.navigationController pushViewController:proceedOrderVC animated:YES];
}

@end
