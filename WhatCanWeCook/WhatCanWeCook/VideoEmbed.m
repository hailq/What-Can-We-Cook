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
	
    NSString *htmlString = @"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 320\"/></head><body style=\"background:#F00;margin-top:0px;margin-left:0px\"><div><object width=\"320\" height=\"504\"><param name=\"movie\" value=\"http://www.youtube.com/embed/scJi0ekLKDM\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"http://www.youtube.com/embed/scJi0ekLKDM\"type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"320\" height=\"504\"></embed></object></div></body></html>";
    
    [thumbnailView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.your-url.com"]];

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
