//
//  ViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-11.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myShoppingCart = [[ShoppingCart alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"clothSegue"]) {
        ClothViewController* clothViewController = segue.destinationViewController;
        clothViewController.delegate = self;
    }else if([[segue identifier] isEqualToString:@"drinkSegue"]){
        DrinkViewController* drinkViewController = segue.destinationViewController;
        drinkViewController.delegate = self;
    }else if([[segue identifier] isEqualToString:@"foodSegue"]){
        FoodViewController* foodViewController = segue.destinationViewController;
        foodViewController.delegate = self;
    }else if([[segue identifier] isEqualToString:@"itemSegue"]){
        ItemViewController* itemController = segue.destinationViewController;
        NSMutableArray* arrayItem = [[NSMutableArray alloc] init];
        for(int i=0; i<self.myShoppingCart.list.count; i++){
            [arrayItem addObject:[self.myShoppingCart.list objectAtIndex:i].name];
        }
        itemController.items = arrayItem;
    }
}

-(void)addItem:(Product*)item{
    [self.myShoppingCart addProduct:item];
    [self.myShoppingCart calculate];
    self.totalPrice.text = [NSString stringWithFormat:@"%d$", self.myShoppingCart.totalPrice];
}

@end
