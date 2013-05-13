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

    @property(copy) NSString *recipeName;
    @property(copy) NSString *webLink;
    @property(copy) NSString *videoLink;
    @property(copy) NSString *directions;
    @property(copy) NSArray  *ingredients;
    @property(copy) NSData   *recipeImage;

@end
