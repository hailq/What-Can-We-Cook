//
//  HavingViewController.m
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/18/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import "HavingViewController.h"
#import "HavingTableViewCell.h"
#import "Recipe.h"

@interface HavingViewController ()

@end


@implementation HavingViewController

@synthesize havingArray = havingArray_;

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
    return [havingArray_ count];
}

#pragma mark Table View Delegate Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"tableIdentifier";
    
    HavingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[HavingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    //Recipe *recipe = (Recipe*)[havingArray_ objectAtIndex:[indexPath.row]];
    
    switch (indexPath.row) {
        case 0:
            cell.amount.text = @"0.3";
            cell.unit.text = @"kg";
            cell.ingredient.text = @"rice";
            break;
        case 1:
            cell.amount.text = @"2";
            cell.unit.text = @" ";
            cell.ingredient.text = @"eggs";
            break;
            
        default:
            break;
    }
    
    return cell;
}


- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
