//
//  ProductCell.m
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

- (void)awakeFromNib {
    // Initialization code
    
    self.exclusiveTouch = YES;
    [self.addRemoveButon addTarget:self action:@selector(addRemoveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setProductModel:(Product *)productModel
{
    _productModel = productModel;
    
    self.productName.text = productModel.productName;
    self.productPrice.text = [NSString stringWithFormat:@"%@", productModel.productPrice];
}

- (void)setProductDetailModel:(ProductDetail *)productDetailModel
{
    [self.addRemoveButon setHidden:NO];
    [self.imageView setHidden:NO];
    
    NSData *imageData = [NSData dataWithContentsOfURL:productDetailModel.imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    [self.imageView setImage:image];
    
    self.productDetail.text = productDetailModel.detail;
    self.productReviews.text = [NSString stringWithFormat:@"%d", productDetailModel.reviews];
    self.productInStock.text = productDetailModel.inStock ? @"YES" : @"NO";
    self.productStar.text = [NSString stringWithFormat:@"%.1f", productDetailModel.star];
}

- (IBAction)addRemoveButtonTapped:(id)sender
{
    [self.delegate didNewOrderCountEnteredForProduct:_productModel.productId];
}

@end
