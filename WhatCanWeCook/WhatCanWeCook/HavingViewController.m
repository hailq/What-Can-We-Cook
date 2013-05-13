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
#import "Ingredient.h"

@interface HavingViewController ()

@end


@implementation HavingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    havingArray = [[NSMutableArray alloc] init];
    
    if (self.userIngredients != nil && self.ingredientsArray != nil) {
        
        for (Ingredient *ingredient in self.ingredientsArray) {
            NSString *type = ingredient.ingredientType;
            
            for (NSString *user in self.userIngredients) {
                
                //Checking each ingredient of user in the ingredient array
                if ([type rangeOfString:user].location != NSNotFound) {
                    [havingArray addObject:ingredient]; //have ingredient
                }
            }
        }
    }
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
    return [havingArray count];
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
    
    Ingredient *ingredient = [havingArray objectAtIndex:[indexPath row]];
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.amount.text = [NSString stringWithFormat:@"%.1f", ingredient.ingredientAmount];
    cell.unit.text = ingredient.ingredientMeasure;
    cell.ingredient.text = ingredient.ingredientType;
    
    return cell;
}


- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
