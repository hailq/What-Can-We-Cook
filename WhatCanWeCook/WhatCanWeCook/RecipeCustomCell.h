//
//  RecipeCustomCell.h
//  WhatCanWeCook
//
//  Created by hust9 on 5/12/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCustomCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *cellImageView;
@property (retain, nonatomic) IBOutlet UILabel *cellRecipeName;
@property (retain, nonatomic) IBOutlet UILabel *cellRecipeRating;
@property (retain, nonatomic) IBOutlet UILabel *cellRecipeTime;

@property (strong, nonatomic) NSString *recipeName;
@property int cookTime;
@property float rating;


@end
