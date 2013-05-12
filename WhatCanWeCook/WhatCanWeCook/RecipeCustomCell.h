//
//  RecipeCustomCell.h
//  WhatCanWeCook
//
//  Created by hust9 on 5/12/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellRecipeName;
@property (weak, nonatomic) IBOutlet UILabel *cellRecipeRating;


@end
