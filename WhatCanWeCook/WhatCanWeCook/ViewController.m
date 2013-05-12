//
//  ViewController.m
//  WebView
//
//  Created by uics2 on 4/16/13.
//  Copyright (c) 2013 Jathan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url =[NSURL URLWithString:@"http://m.foodnetwork.com/recipes/recipe/644745"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
}


- (IBAction)backHandle:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)refreshHandler:(UIBarButtonItem *)sender {
    [self.webView reload];
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
