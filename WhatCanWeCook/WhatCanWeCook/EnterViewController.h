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

@property (weak, nonatomic) IBOutlet UITextField *txtIngredients;
@property (strong, nonatomic) UIButton *menuBT;

- (IBAction)submitTap:(id)sender;


@end
