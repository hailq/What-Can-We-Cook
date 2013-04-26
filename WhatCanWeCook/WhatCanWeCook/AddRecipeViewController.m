//
//  AddRecipeViewController.m
//  WhatCanWeCook
//
//  Created by uics2 on 4/26/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "AddRecipeViewController.h"

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController
@synthesize webView;


- (void)viewDidLoad
{
    NSURL *url =[NSURL URLWithString:@"http://serv11.divms.uiowa.edu/~ios5/webform/"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
    
    [super viewDidLoad];
}


@end
