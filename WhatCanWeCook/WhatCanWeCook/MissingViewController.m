//
//  MissingViewController.m
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/10/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import "MissingViewController.h"
#import "HavingTableViewCell.h"

@interface MissingViewController ()

@end

@implementation MissingViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table View DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark Table View Delegate Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"tableIdentifier";
    
    HavingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[HavingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            cell.amount.text = @"0.2";
            cell.unit.text = @"kg";
            cell.ingredient.text = @"beef";
            break;
        
            
        default:
            break;
    }
    
    return cell;
}

@end
