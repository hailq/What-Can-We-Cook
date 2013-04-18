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
    
    NSURL *url =[NSURL URLWithString:@"http://m.foodnetwork.com/recipes/recipe/644745"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
    
    [super viewDidLoad];

}


@end
