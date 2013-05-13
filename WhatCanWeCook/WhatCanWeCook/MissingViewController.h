//
//  MissingViewController.h
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/10/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissingViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *missingArray;
}

@property (strong, nonatomic) NSMutableArray *userIngredients;
@property (strong, nonatomic) NSMutableArray *ingredientsArray;

- (IBAction)backHandler:(UIBarButtonItem *)sender;
@end
