//
//  RatingView.m
//  WhatCanWeCook
//
//  Created by HAILQ on 4/8/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView

@synthesize emptySelectedImage = _emptySelectedImage;
@synthesize halfSelectedImage = _halfSelectedImage;
@synthesize fullSelectedImage = _fullSelectedImage;
@synthesize rating = _rating;
@synthesize editable = _editable;
@synthesize imageViews = _imageViews;
@synthesize maxRating = _maxRating;
@synthesize midMargin = _midMargin;
@synthesize leftMargin = _leftMargin;
@synthesize minImageSize = _minImageSize;
@synthesize delegate = _delegate;

-(void)initValue
{
    _emptySelectedImage = nil;
    _halfSelectedImage = nil;
    _fullSelectedImage = nil;
    _rating = 0;
    _editable = NO;
    _imageViews = [[NSMutableArray alloc] init];
    _maxRating = 5;
    _midMargin = 5;
    _leftMargin = 0;
    _minImageSize = CGSizeMake(5, 5);
    _delegate = nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initValue];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self initValue];
    }
    return self;
}

- (void)refreshView
{
    for (int i = 0; i < [self.imageViews count]; i++) {
        UIImageView *imgView = [self.imageViews objectAtIndex:i];
        
        if (self.rating >= (float)(i + 1)) {
            imgView.image = self.fullSelectedImage;
        } else if (self.rating > i) {
            imgView.image = self.halfSelectedImage;
        } else {
            imgView.image = self.emptySelectedImage;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if(self.emptySelectedImage == nil)
        return;
    
    float desiredImageWidth = (self.frame.size.width - (self.leftMargin * 2) - (self.midMargin * self.imageViews.count)) / self.imageViews.count;
    
    float imgWidth = MAX(self.minImageSize.width, desiredImageWidth);
    float imgHeight = MAX(self.minImageSize.height, self.frame.size.height);
    
    for (int i = 0; i < [self.imageViews count]; i++) {
        UIImageView *imgView = [self.imageViews objectAtIndex:i];
        CGRect imgFrame = CGRectMake(self.leftMargin + i * (self.midMargin + imgWidth), 0, imgWidth, imgHeight);
        imgView.frame = imgFrame;
    }
}

- (void)setMaxRating:(int)maxRating
{
    _maxRating = maxRating;
    
    for (int i = 0; i < [self.imageViews count]; i++) {
        UIImageView *imgView = (UIImageView *)[self.imageViews objectAtIndex:i];
        [imgView removeFromSuperview];
    }
    [self.imageViews removeAllObjects];
    
    //Add new image
    for (int i = 0; i < maxRating; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self.imageViews addObject:imgView];
        [self addSubview:imgView];
    }
    
    [self setNeedsLayout];
    [self refreshView];
}

- (void)setEmptySelectedImage:(UIImage *)emptySelectedImage
{
    _emptySelectedImage = emptySelectedImage;
    [self refreshView];
}

- (void)setHalfSelectedImage:(UIImage *)halfSelectedImage
{
    _halfSelectedImage = halfSelectedImage;
    [self refreshView];
}

- (void)setFullSelectedImage:(UIImage *)fullSelectedImage
{
    _fullSelectedImage = fullSelectedImage;
    [self refreshView];
}

- (void)setRating:(float)rating
{
    _rating = rating;
    [self refreshView];
}

//Touch Detection
- (void)touchAtLocation:(CGPoint)touchLocation
{
    if (!self.editable) {
        return;
    }
    
    int newRating = 0;
    for (int i = self.imageViews.count -1; i >= 0; i--) {
        UIImageView *imgView = [self.imageViews objectAtIndex:i];
        
        if (touchLocation.x > imgView.frame.origin.x) {
            newRating = i + 1;
            break;
        }
    }
    
    self.rating = newRating;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self touchAtLocation:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self touchAtLocation:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate ratingView:self ratingDidChanged:self.rating];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
