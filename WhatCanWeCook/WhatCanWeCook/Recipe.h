//
//  Recipe.h
//  WhatCanWeCook
//
//  Created by HAILQ on 5/1/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

    @property int recipeId;
    @property int cookTime;
    @property float recipeRanking;

    @property(strong) NSString *recipeName;
    @property(strong) NSString *webLink;
    @property(strong) NSString *videoLink;
    @property(copy) NSString *directions;
    @property(retain, nonatomic) NSMutableArray  *ingredients;
    @property(strong) NSData   *recipeImage;

@end
