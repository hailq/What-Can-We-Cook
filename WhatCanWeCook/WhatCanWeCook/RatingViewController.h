//
//  RatingViewController.h
//  WhatCanWeCook
//
//  Created by HAILQ on 4/7/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"

@interface RatingViewController : UIViewController <UITextViewDelegate, RatingViewDelegate>

@property int recipeId;

@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

@property (weak, nonatomic) IBOutlet RatingView *starRatingView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *submitSpinning;

- (IBAction)backHandler:(UIBarButtonItem *)sender;

- (IBAction)submitRating:(id)sender;
@end
