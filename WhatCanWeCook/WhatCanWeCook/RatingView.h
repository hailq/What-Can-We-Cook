//
//  RatingView.h
//  WhatCanWeCook
//
//  Created by HAILQ on 4/8/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RatingView;

@protocol RatingViewDelegate

-(void)ratingView:(RatingView *)ratingView ratingDidChanged:(float)rating;

@end

@interface RatingView : UIView

@property (strong,nonatomic) UIImage *emptySelectedImage;
@property (strong,nonatomic) UIImage *halfSelectedImage;
@property (strong,nonatomic) UIImage *fullSelectedImage;
@property (assign,nonatomic) float rating;
@property (assign) BOOL editable;
@property (strong) NSMutableArray *imageViews;
@property (assign, nonatomic) int maxRating;
@property (assign) int midMargin;
@property (assign) int leftMargin;
@property (assign) CGSize minImageSize;
@property (assign) id<RatingViewDelegate> delegate;

@end
