//
//  MenuViewController.m
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/8/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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

#pragma mark - Segue Method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

#pragma mark -
#pragma mark Table View Data Source Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

#pragma mark Table View Delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"tableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            cell.textLabel.text = @"Enter Ingredient";
            break;
        case 1:
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            cell.textLabel.text = @"Result";
            break;
        case 2:
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            cell.textLabel.text = @"Recipe";
            break;
        case 3:
            cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
            cell.textLabel.text = @"Add a recipe";
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"SegueEnterIngredient" sender:cell];
    }
    
    else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"SegueResultScreen" sender:cell];
    }
    
    else if (indexPath.row == 2){
        [self performSegueWithIdentifier:@"SegueRecipeScreen" sender:cell];
    }
    
    else{
        [self performSegueWithIdentifier:@"SegueAddRecipeScreen" sender:cell];
    }
}
@end
