//
//  RatingViewController.m
//  WhatCanWeCook
//
//  Created by HAILQ on 4/7/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "RatingViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kOFFSET_FOR_KEYBOARD 110

@interface RatingViewController ()

@end

@implementation RatingViewController

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
    
    // Handle Star rating view
    self.starRatingView.emptySelectedImage = [UIImage imageNamed:@"star_empty.png"];
    self.starRatingView.halfSelectedImage = [UIImage imageNamed:@"star_half_left.png"];
    self.starRatingView.fullSelectedImage = [UIImage imageNamed:@"star_full.png"];
    self.starRatingView.rating = 0;
    self.starRatingView.editable = YES;
    self.starRatingView.maxRating = 5;
    self.starRatingView.delegate = self;
    
    [self.view addSubview:self.starRatingView];
    
    //Initialize text view
    self.commentTextView.textAlignment = NSTextAlignmentLeft;
    self.commentTextView.clipsToBounds = YES;
    self.commentTextView.layer.cornerRadius = 10;
    
    [self.commentTextView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.commentTextView.layer setBorderWidth:2.0f];
    //End initialize text view
    
    self.commentTextView.text = @"Write your comment here ...";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hidePlaceHolderTextView
{
    if ([self.commentTextView.text isEqualToString:@"Write your comment here ..."]) {
        self.commentTextView.text = @"";
    }
}

-(void)showPlaceHolderTextView
{
    if ([self.commentTextView.text length] <= 0) {
        self.commentTextView.text = @"Write your comment here ...";
    }
}

- (IBAction)tapHideKeyBoard:(id)sender {
    if (![sender isKindOfClass:[UITextView class]]) {
        [self.commentTextView resignFirstResponder];
    }
}

- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Text View Delegate Method

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self hidePlaceHolderTextView];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect rect = self.view.frame;
    
    // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
    // 2. increase the size of the view so that the area behind the keyboard is covered up.
    
    if (rect.origin.y == 0 ) {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
    }
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self showPlaceHolderTextView];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect rect = self.view.frame;
    
    if (rect.origin.y != 0)
    {
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}

#pragma mark Rating View Delegate Method
- (void)ratingView:(RatingView *)ratingView ratingDidChanged:(float)rating
{
    NSLog(@"rating: %f",rating);
}

@end
