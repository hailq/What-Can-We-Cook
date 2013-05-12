//
//  EnterViewController.h
//  WhatCanWeCook
//
//  Created by HAILQ on 4/6/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeParser.h"

@interface EnterViewController : UIViewController
{
    NSMutableArray *filterArray;
    NSMutableArray *ingredients;
    
    NSArray *countryArray;
    NSArray *categoryArray;
    NSArray *sortArray;
    
    @private __weak IBOutlet UIView *sortView;
    
    @private __weak IBOutlet UIView *countryView;
    
    @private __weak IBOutlet UIView *categoryView1;
    
    @private __weak IBOutlet UIView *categoryView2;
}

@property (weak, nonatomic) IBOutlet UITextField *txtIngredients;
@property (strong, nonatomic) NSMutableArray *sort;
@property (strong, nonatomic) NSMutableArray *country;
@property (strong, nonatomic) NSMutableArray *category;
@property (strong, nonatomic) UIButton *menuBT;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;

- (IBAction)submitTap:(id)sender;


@end
