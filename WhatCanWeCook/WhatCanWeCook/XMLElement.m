//
//  XMLElement.m
//  WhatCanWeCook
//
//  Created by HAILQ on 5/1/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "XMLElement.h"

@implementation XMLElement

-(NSMutableArray *)subElements
{
    if (_subElements == nil) {
        _subElements = [[NSMutableArray alloc] init];
    }
    return _subElements;
}

@end
