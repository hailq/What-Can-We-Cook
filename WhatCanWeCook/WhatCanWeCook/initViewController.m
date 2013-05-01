//
//  initViewController.m
//  WhatCanWeCook
//
//  Created by hust9 on 4/30/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "initViewController.h"

@interface initViewController ()

@end

@implementation initViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Ingredient"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
