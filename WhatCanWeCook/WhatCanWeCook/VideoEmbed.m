//
//  VideoEmbed.m
//  WebView
//
//  Created by uics2 on 4/17/13.
//  Copyright (c) 2013 Jathan. All rights reserved.
//

#import "VideoEmbed.h"

@interface VideoEmbed ()

@end

@implementation VideoEmbed
@synthesize thumbnailView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *embedHTML = @"<html><head>\
    <style type=\"text/css\">\
    body {\
    background-color:rgb(255,254,236);\
    style=\"margin-left: auto; margin-right: auto;\";\
    }\
    </style>\
    </head><body>\
    <iframe type=\"text/html\" width=\"100%\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\"></iframe>\
    </body></html>";
    NSString* html = [NSString stringWithFormat:embedHTML, @"2xtqVECh0Js"];
    
    [thumbnailView loadHTMLString:html baseURL:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)dealloc
{
    [super dealloc];
    [thumbnailView release];
}*/

@end
