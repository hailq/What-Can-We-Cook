//
//  MissingViewController.m
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/10/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import "MissingViewController.h"
#import "HavingTableViewCell.h"
#import "Ingredient.h"

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
    missingArray = [[NSMutableArray alloc] init];
    
    if (self.userIngredients != nil && self.ingredientsArray != nil) {
        
        for (Ingredient *ingredient in self.ingredientsArray) {
            int isMissing = 1;
            NSString *type = ingredient.ingredientType;
            
            for (NSString *user in self.userIngredients) {
                
                //Checking each ingredient of user in the ingredient array
                if ([type rangeOfString:user].location != NSNotFound) {
                    isMissing = 0;  //have user ingredient
                }
            }
            if (isMissing) {
                [missingArray addObject:ingredient]; //Add missing ingredient;
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Table View DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [missingArray count];
}

#pragma mark Table View Delegate Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"tableIdentifier";
    
    HavingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[HavingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    Ingredient *ingredient = [missingArray objectAtIndex:[indexPath row]];
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.amount.text = [NSString stringWithFormat:@"%.1f", ingredient.ingredientAmount];
    cell.unit.text = ingredient.ingredientMeasure;
    cell.ingredient.text = ingredient.ingredientType;
    
    return cell;
}


@end
