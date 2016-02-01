//
//  ProductCell.h
//  mStore
//
//  Created by Cihangir Sungur on 1/28/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "ProductDetail.h"

@protocol AddRemoveOrderProtocol <NSObject>
@required

- (void)didNewOrderCountEnteredForProduct:(int)productId;

@end

@interface ProductCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *productName;
@property (nonatomic, strong) IBOutlet UILabel *productPrice;
@property (nonatomic, strong) IBOutlet UILabel *productStar;
@property (nonatomic, strong) IBOutlet UILabel *productReviews;
@property (nonatomic, strong) IBOutlet UILabel *productDetail;
@property (nonatomic, strong) IBOutlet UILabel *productInStock;
@property (nonatomic, strong) IBOutlet UIButton *addRemoveButon;

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) Product *productModel;

@property (nonatomic, weak) id<AddRemoveOrderProtocol> delegate;

- (void)setProductModel:(Product *)productModel;
- (void)setProductDetailModel:(ProductDetail *)productDetailModel;

@end
