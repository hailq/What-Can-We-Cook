//
//  XMLParser.m
//  WhatCanWeCook
//
//  Created by HAILQ on 5/1/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "XMLParser.h"
#import "XMLElement.h"

@implementation XMLParser

@synthesize xmlParser;

-(BOOL)initWithXmlString:(NSString *)xmlString
{

    NSData *xml = [xmlString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];

    self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
    self.xmlParser.delegate = self;

    if([self.xmlParser parse])
    {
        NSLog(@"XML is parsed");
    } else {
        NSLog(@"Failed to parse XML");
    }
    return YES;
}


#pragma mark-
#pragma mark XMLParser Delegate Methods
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.rootElement = nil;
    self.currentElementPointer = nil;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (self.rootElement == nil) {
        /* Create a root element and point to it */
        self.rootElement = [[XMLElement alloc] init];
        self.currentElementPointer = self.rootElement;
    } else {
        /* Create new element and add it as one of the subelements of current element */
        XMLElement *newElement = [[XMLElement alloc] init];
        newElement.parent = self.currentElementPointer;
        [self.currentElementPointer.subElements addObject:newElement];
        self.currentElementPointer = newElement;
    }
    
    self.currentElementPointer.name = elementName;
    self.currentElementPointer.attributes = attributeDict;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.currentElementPointer.text length] > 0) {
        self.currentElementPointer.text = [self.currentElementPointer.text stringByAppendingString:string];
    } else {
        self.currentElementPointer.text = string;
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    /* Point xml element pointer back one level */
    self.currentElementPointer = self.currentElementPointer.parent;
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    self.currentElementPointer = nil;
}

@end
