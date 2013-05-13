//
//  Ingredient.h
//  WhatCanWeCook
//
//  Created by hust9 on 5/13/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredient : NSObject

@property float ingredientAmount;
@property (strong, nonatomic) NSString *ingredientMeasure;
@property (strong, nonatomic) NSString *ingredientType;

@end
