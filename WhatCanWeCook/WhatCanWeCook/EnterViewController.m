//
//  EnterViewController.m
//  WhatCanWeCook
//
//  Created by HAILQ on 4/6/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "EnterViewController.h"

@interface EnterViewController () {
    NSMutableArray *filterArray;
}
@end

@implementation EnterViewController

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
    
    filterArray = [NSMutableArray new];
    
    for (int i = 1; i <= 11; i++) {
        [filterArray addObject: [self.view viewWithTag:i]];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkSelected:(UIButton *)sender {
    if(!sender.selected)
    {
        [sender setSelected:YES];
    }
    else
        [sender setSelected:NO];
}

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}


@end
