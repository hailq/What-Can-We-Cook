//
//  AddRecipeViewController.h
//  WhatCanWeCook
//
//  Created by uics2 on 4/26/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "ViewController.h"

@interface AddRecipeViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSpinning;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UIButton *menuBT;

- (IBAction)refreshHandler:(UIBarButtonItem *)sender;

@end
