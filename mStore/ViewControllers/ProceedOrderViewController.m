//
//  ProceedOrderViewController.m
//  mStore
//
//  Created by Cihangir Sungur on 1/29/16.
//  Copyright © 2016 Cihangir Sungur. All rights reserved.
//

#import "ProceedOrderViewController.h"

@interface ProceedOrderViewController ()

@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *phoneTextField;
@property (nonatomic, strong) IBOutlet UITextField *nameTextField;

@end

@implementation ProceedOrderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Proceed Order";
    
    [self.phoneTextField setDelegate:self];
    [self.nameTextField setDelegate:self];
    [self.emailTextField setDelegate:self];
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneTextField)
    {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }

    if (textField == self.nameTextField)
    {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    
    return YES;
}

#pragma mark - Actions

- (IBAction)checkoutButtonTapped:(id)sender
{
    NSMutableArray *orderArray = [[StoreNetworkManager sharedManager] orderDataAray];
    
    NSMutableArray *postOrderArray = [NSMutableArray array];
    
    for (Order *order in orderArray)
    {
        NSMutableDictionary *orderDictionary = [NSMutableDictionary dictionary];
        [orderDictionary setValue:@(order.count) forKey:@"count"];
        [orderDictionary setValue:@(order.product.productId) forKey:@"productId"];
        
        [postOrderArray addObject:orderDictionary];
    }
    
    NSMutableDictionary *userData = [NSMutableDictionary dictionary];
    
    [userData setObject:self.emailTextField.text forKey:@"email"];
    [userData setObject:self.phoneTextField.text forKey:@"phone"];
    [userData setObject:self.nameTextField.text forKey:@"name"];
    [userData setObject:postOrderArray forKey:@"orders"];
    
    [[StoreNetworkManager sharedManager] checkoutOrderWithData:userData withCallback:^(CheckoutOrderResponse *response) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"Success" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            [[[StoreNetworkManager sharedManager] orderDataAray] removeAllObjects];
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

@end
