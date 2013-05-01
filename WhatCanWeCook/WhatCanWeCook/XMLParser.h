//
//  XMLParser.h
//  WhatCanWeCook
//
//  Created by HAILQ on 5/1/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLElement.h"

@class XMLElement;

@interface XMLParser : NSObject<NSXMLParserDelegate>

@property(nonatomic,strong) NSXMLParser *xmlParser;
@property(nonatomic,strong) XMLElement *rootElement;
@property(nonatomic,strong) XMLElement *currentElementPointer;

-(BOOL)initWithXmlString: (NSString*)xmlString;

@end
