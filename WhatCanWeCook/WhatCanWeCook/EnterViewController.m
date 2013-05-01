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

@interface EnterViewController () {
    NSMutableArray *filterArray;
    NSArray *ingredients;
    NSArray *country;
    NSArray *category;
}
@end

@implementation EnterViewController

@synthesize menuBT;

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
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    self.menuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBT.frame = CGRectMake(8, 10, 34, 24);
    [menuBT setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBT addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.menuBT];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
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

- (IBAction)submitTap:(id)sender {
    RecipeParser *rps = [RecipeParser new];
    [rps startParser:@"<?xml version='1.0' encoding='utf-8' ?><recipes><recipe id='1'><name>test1</name><rating>2</rating><time>30min</time><web>http://test.com</web><video>http://test_video.com</video><ingredients><ingredient><amount></amount><measure></measure><type></type></ingredient></ingredients> <directions><step></step><instruction></instruction></directions></recipe><recipe id='2'><name>test2</name><rating>2</rating><time>32min</time><web>http://test2.com</web><video>http://test_video2.com</video><ingredients><ingredient><amount></amount><measure></measure><type></type></ingredient></ingredients><directions><step></step><instruction></instruction></directions></recipe><recipes>"];

}
@end
