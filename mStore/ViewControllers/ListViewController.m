//
//  ListViewController.m
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ListViewController.h"
#import "OrderViewController.h"

@interface ListViewController ()

@property (nonatomic, strong) IBOutlet UISearchBar *search;
@property (nonatomic, strong) IBOutlet UICollectionView *productCollectionView;

@property (nonatomic, strong) NSMutableArray *productArray;
@property (nonatomic, strong) NSMutableArray *originalProductArray;
@property (nonatomic, strong) ProductDetail *productDetail;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Store";
    
    [self.productCollectionView registerNib:[UINib nibWithNibName:@"ProductCell" bundle:nil] forCellWithReuseIdentifier:@"PRODUCTCELL"];
    
    [[StoreNetworkManager sharedManager] fetchProductsWithCallback:^(ProductResponse *response) {
        self.productArray = response.productArray ;
        self.originalProductArray = [NSMutableArray arrayWithArray:self.productArray];
        [self.productCollectionView reloadData];
    }];
    
}

#pragma mark - UICollectionViewDelegate methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.productArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRODUCTCELL" forIndexPath:indexPath];
    cell.delegate = self;
    
    [cell setProductModel:[self.productArray objectAtIndex:indexPath.row]];
    
    [cell.addRemoveButon setHidden:YES];
    
    if (indexPath == self.selectedIndexPath)
    {
        [cell setProductDetailModel:self.productDetail];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, (indexPath == self.selectedIndexPath) ? 250 : 75);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{    
    [[StoreNetworkManager sharedManager] fetchProductDetailWithId:(int)indexPath.row withCallback:^(ProductDetailResponse *response) {
        self.productDetail = response.productDetail;
        
        self.selectedIndexPath = indexPath;
        
        [collectionView reloadData];
    }];
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [string isEqualToString:filtered];
}

#pragma mark - UISearchBarDelegate methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.selectedIndexPath = nil;
    
    if (![searchText isEqualToString:@""])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productName CONTAINS %@", searchText];
        self.productArray = [NSMutableArray arrayWithArray:[self.originalProductArray filteredArrayUsingPredicate:predicate]];
    }
    
    else
    {
        self.productArray = self.originalProductArray;
    }
    
    [self.productCollectionView reloadData];
}

#pragma mark - Actions

- (void)didNewOrderCountEnteredForProduct:(int)productId
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Order" message:@"Enter order count" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSMutableArray *orderDataArray = [[StoreNetworkManager sharedManager] orderDataAray];
        
        for (Order *order in orderDataArray) {
            if (order.product.productId == productId)
            {
                [orderDataArray removeObject:order];
                break;
            }
        }
        
        if ([alertController.textFields.firstObject.text intValue] != 0) {
            Order *order = [[Order alloc] init];
            order.count = [alertController.textFields.firstObject.text intValue];
            order.product = [self.originalProductArray objectAtIndex:productId];
            
            [orderDataArray addObject:order];
        }

    }];
    
    [alertController addAction:okAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:cancelAction];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        NSMutableArray *orderDataArray = [[StoreNetworkManager sharedManager] orderDataAray];
        
        textField.text = @"1";
        
        for (Order *order in orderDataArray) {
            if (order.product.productId == productId)
            {
                textField.text = [NSString stringWithFormat:@"%d", order.count];
                break;
            }
        }
        
        textField.delegate = self;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.textAlignment = NSTextAlignmentCenter;
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)showOrderButtonTapped:(id)sender
{
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    [self.navigationController pushViewController:orderVC animated:YES];
}


@end
