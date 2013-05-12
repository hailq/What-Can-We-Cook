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
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1 \">\
    <style type=\"text/css\">\
    body {\
    background-color:rgb(255,254,236);\
    style=\"margin-left: auto; margin-right: auto;\";\
    }\
    </style>\
    </head><body>\
    <iframe height=\"400\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\"></iframe>\
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

- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)refreshHandler:(UIBarButtonItem *)sender {
    [thumbnailView stopLoading];
    [thumbnailView reload];
}

#pragma mark -
#pragma mark Web View Delegate Method
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadSpinning stopAnimating];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loadSpinning startAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Load add recipe error = %@",error);
    [self.loadSpinning stopAnimating];
}

@end
