//
//  RecipeParser.h
//  WhatCanWeCook
//
//  Created by HAILQ on 5/1/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"
#import "XMLParser.h"
#import "Recipe.h"

@interface RecipeParser : NSObject
{
    @private XMLParser *parser;
    Recipe *recipe;
}

@property (strong,nonatomic) NSString *xmlString;
@property (copy,nonatomic) NSMutableArray *recipeArray;

-(void)startParser:(NSString*)xmlString;

@end
