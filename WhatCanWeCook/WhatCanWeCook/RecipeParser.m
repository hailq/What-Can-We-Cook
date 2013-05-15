//
//  RecipeParser.m
//  WhatCanWeCook
//
//  Created by HAILQ on 5/1/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "RecipeParser.h"

@implementation RecipeParser

-(NSMutableArray*)recipeArray
{
    if (_recipeArray == nil)
    {
        _recipeArray = [[NSMutableArray alloc] init];
    }
    return _recipeArray;
}

-(void)startParser:(NSString *)xmlString
{
    parser = [XMLParser new];
    
    if( (parser != nil) && ([parser initWithXmlString:xmlString]))
    {
        // Success parser and extract data to object
        
        /* Init value */
        recipe = nil;
        ingredient = nil;
        [self recipeArray];
        XMLElement *currentElemt = parser.rootElement;
        
        if (! [currentElemt.name isEqualToString:kRecipeRoot])
        {
            NSLog(@"XML format error");
            return;
        } else {
            for (XMLElement *element in currentElemt.subElements) {
                
                if ([element.name isEqualToString:kRecipeTag]) {
                    if (recipe != nil) {
                        [_recipeArray addObject:recipe];
                    }
                    
                    recipe = [Recipe new];
                    recipe.recipeId = [[element.attributes valueForKey:@"recipe_id"] intValue];
                    
                    for (XMLElement *e in element.subElements) {
                        NSString *tagName = e.name;
                        
                        /* Check tag element and get element's value */
                        if ([tagName isEqualToString:kRecipeNameTag]) {
                            recipe.recipeName = e.text;
                        } else if ([tagName isEqualToString:kRecipeRatingTag]){
                            recipe.recipeRanking = [e.text floatValue];
                        } else if ([tagName isEqualToString:kRecipeTimeTag]) {
                            recipe.cookTime = [e.text intValue];
                        } else if ([tagName isEqualToString:kRecipeWebTag]) {
                            recipe.webLink = e.text;
                        } else if ([tagName isEqualToString:kRecipeVideoTag]) {
                            recipe.videoLink = e.text;
                        } else if ([tagName isEqualToString:kRecipeDirection]) {
                            recipe.directions = e.text;
                        } else if ([tagName isEqualToString:kRecipeImage]) {
                            NSURL *imageUrl = [NSURL URLWithString:e.text];
                            recipe.recipeImage = [NSData dataWithContentsOfURL:imageUrl];
                        }
                        /* Handle ingredint object */
                        else if ([tagName isEqualToString:kIngredientRootTag])
                        {
                            recipe.ingredients = [[NSMutableArray alloc] init];
                            for (XMLElement *ingredientElement in e.subElements) {
                                if ([ingredientElement.name isEqualToString:kIngredientTag]) {
                                    if (ingredient != nil) {
                                        [recipe.ingredients addObject:ingredient];
                                    }
                                    
                                    ingredient = [Ingredient new];
                                    
                                    for (XMLElement *ingredientAttr in ingredientElement.subElements) {
                                        NSString *attrName = ingredientAttr.name;
                                        
                                        if ([attrName isEqualToString:kIngredientAmount]) {
                                            ingredient.ingredientAmount = [ingredientAttr.text floatValue];
                                        } else if ([attrName isEqualToString:kIngredientMeasure])
                                        {
                                            ingredient.ingredientMeasure = ingredientAttr.text;
                                            
                                        } else if ([attrName isEqualToString:kIngredientType]){
                                            
                                            ingredient.ingredientType = ingredientAttr.text;
                                        }
                                    }
                                }
                            }
                            
                            if (ingredient != nil) {
                                [recipe.ingredients addObject:ingredient];
                            }
                        }
                    }
                }
            }
        }
        
        if (recipe != nil) {
            [_recipeArray addObject:recipe];
        }
    }
}

@end
