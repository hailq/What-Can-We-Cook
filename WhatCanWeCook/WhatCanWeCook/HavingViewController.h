//
//  HavingViewController.h
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/18/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HavingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *havingArray;
}

@property (strong, nonatomic) NSMutableArray *ingredientsArray;
@property (strong, nonatomic) NSMutableArray *userIngredients;

- (IBAction)backHandler:(UIBarButtonItem *)sender;

@end
