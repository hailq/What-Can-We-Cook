//
//  EnterViewController.m
//  WhatCanWeCook
//
//  Created by HAILQ on 4/6/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "EnterViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "Psample.h"

@interface EnterViewController ()
@end

@implementation EnterViewController

@synthesize country = country_;
@synthesize category = category_;
@synthesize menuBT;
@synthesize panGesture = panGesture_;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /* Initialize information array */
    sortArray = [[NSArray alloc] initWithObjects:@"Rating",@"Relevence",@"Fatest Time", nil];
    countryArray = [[NSArray alloc] initWithObjects:@"American",@"Indian",@"Vietnamese", nil];
    categoryArray = [[NSArray alloc] initWithObjects:@"Appetizers",@"Beverages",@"Breakfast",@"Desserts",@"Dinner",@"Lunch", nil];
    
    /* Initialize array */
    self.sortKind = 0;
    country_ = [[NSMutableArray alloc] init];
    category_ = [[NSMutableArray alloc] init];
    
    /* Sliding Menu */
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    panGesture_ = self.slidingViewController.panGesture;
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    self.menuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBT.frame = CGRectMake(8, 10, 34, 24);
    [menuBT setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBT addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.menuBT];
    // End sliding menu

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)checkSortSelected:(UIButton *)sender {
    if(!sender.selected)
    {
        //Set uncheck for all button
        for (UIView *view in [sortView subviews]) {
            if ([view isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)view;
                [button setSelected:NO];
            }
        }
        [sender setSelected:YES];//Set sender checked
    }
    else
    {
        [sender setSelected:NO];
    }
    
    if ([[sender titleForState:UIControlStateSelected] isEqualToString:@"Rating"]) {
        self.sortKind = 0;
    } else {
        self.sortKind = 1;
    }
}

- (IBAction)checkCountrySelected:(UIButton *)sender {
    if (!sender.selected) {
        [sender setSelected:YES];
        [country_ addObject:[sender titleForState:UIControlStateSelected]];
    }
    else
    {
        [sender setSelected:NO];
        [country_ removeObject:[sender titleForState:UIControlStateSelected]];
    }
}

- (IBAction)checkCategorySelected:(UIButton *)sender {
    if (!sender.selected) {
        [sender setSelected:YES];
        [category_ addObject:[sender titleForState:UIControlStateSelected]];
    }
    else
    {
        [sender setSelected:NO];
        [category_ removeObject:[sender titleForState:UIControlStateSelected]];
    }
}

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)submitTap:(id)sender {
    /*
    RecipeParser *rps = [RecipeParser new];
    [rps startParser:@"<?xml version='1.0' encoding='utf-8' ?><recipes><recipe id='1'><name>test1</name><rating>2</rating><time>30min</time><web>http://test.com</web><video>http://test_video.com</video><ingredients><ingredient><amount></amount><measure></measure><type></type></ingredient></ingredients> <directions><step></step><instruction></instruction></directions></recipe><recipe id='2'><name>test2</name><rating>2</rating><time>32min</time><web>http://test2.com</web><video>http://test_video2.com</video><ingredients><ingredient><amount></amount><measure></measure><type></type></ingredient></ingredients><directions><step></step><instruction></instruction></directions></recipe><recipes>"];
     */

//    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Result"];
 //   [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark -
#pragma Navigation Method
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"EnterToResultSegue"])
    {
        Psample *resultView = segue.destinationViewController;
        
        if ([country_ count ] > 0)
        {
            if (resultView.countriesRequest == nil) {
                resultView.countriesRequest = [[NSMutableArray alloc] init];
            }
            [resultView.countriesRequest addObjectsFromArray:country_];
        }
        
        if ([category_ count] > 0) {
            if (resultView.categoriesRequest == nil) {
                resultView.categoriesRequest = [[NSMutableArray alloc] init];
            }
            [resultView.categoriesRequest addObjectsFromArray:category_];
        }
        
        resultView.ingredientsRequest = self.txtIngredients.text;
        resultView.sortKind = self.sortKind;
    }
}

@end
