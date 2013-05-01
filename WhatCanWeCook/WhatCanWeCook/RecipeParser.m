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
                    recipe.recipeId = [[element.attributes valueForKey:@"id"] intValue];
                    
                    for (XMLElement *e in element.subElements) {
                        NSString *tagName = e.name;
                        
                        /* Check tag element and get element's value */
                        if ([tagName isEqualToString:kRecipeNameTag]) {
                            recipe.recipeName = e.text;
                        } else if ([tagName isEqualToString:kRecipeRatingTag]){
                            recipe.recipeRanking = [e.text floatValue];
                        } else if ([tagName isEqualToString:kRecipeTimeTag]) {
                            recipe.cookTime = e.text;
                        } else if ([tagName isEqualToString:kRecipeWebTag]) {
                            recipe.webLink = e.text;
                        } else if ([tagName isEqualToString:kRecipeVideoTag]) {
                            recipe.videoLink = e.text;
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
