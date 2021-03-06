//
//  Precipe.m
//  New
//
//  Created by uicsi5 on 4/9/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import "Precipe.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "VideoEmbed.h"
#import "ViewController.h"
#import "HavingViewController.h"
#import "MissingViewController.h"
#import "RatingViewController.h"

@implementation Precipe

@synthesize img, imageview, label, introString, menuBT;

- (void)viewDidLoad
{
    [label setText:self.recipeName];
    [imageview setImage:img];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (self.slidingViewController.panGesture != nil)
    {
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
    self.menuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBT.frame = CGRectMake(8, 10, 34, 24);
    [menuBT setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBT addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.slidingViewController.panGesture != nil)
    {
        [self.view addSubview:self.menuBT];
    }
    
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"DetailToWebSegue"]) {
        ViewController *webViewController = segue.destinationViewController;
        webViewController.webLink = self.webLink;
        webViewController.textView.text = self.direction;
    }
    
    else if ([[segue identifier] isEqualToString:@"DetailToVideoSegue"]){
        VideoEmbed *videoViewController = segue.destinationViewController;
        videoViewController.videoLink = self.videoLink;
    }
    
    else if ([[segue identifier] isEqualToString:@"DetailToDirectionSegue"])
    {
        ViewController *directionView = segue.destinationViewController;
            directionView.direction = self.direction;
    }
    
    else if ([[segue identifier] isEqualToString:@"DetailToHavingSegue"])
    {
        HavingViewController *having = segue.destinationViewController;
        
        if (having.ingredientsArray == nil) {
            having.ingredientsArray = [[NSMutableArray alloc] init];
        }
        [having.ingredientsArray addObjectsFromArray:self.ingredientsArray];
        
        if (having.userIngredients == nil) {
            having.userIngredients = [[NSMutableArray alloc] init];
        }
        [having.userIngredients addObjectsFromArray:self.userIngredients];
    }
    
    else if ([[segue identifier] isEqualToString:@"DetailToMissingSegue"])
    {
        MissingViewController *missing = segue.destinationViewController;
        
        if (missing.ingredientsArray == nil) {
            missing.ingredientsArray = [[NSMutableArray alloc] init];
        }
        [missing.ingredientsArray addObjectsFromArray:self.ingredientsArray];
        
        if (missing.userIngredients == nil) {
            missing.userIngredients = [[NSMutableArray alloc] init];
        }
        [missing.userIngredients addObjectsFromArray:self.userIngredients];
    }
    else if ([[segue identifier] isEqualToString:@"DetailToRatingSegue"])
    {
        RatingViewController *rating = segue.destinationViewController;
        rating.recipeId = self.recipeId;
    }
}

@end
