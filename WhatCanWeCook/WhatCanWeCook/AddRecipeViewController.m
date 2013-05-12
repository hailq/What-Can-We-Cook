//
//  AddRecipeViewController.m
//  WhatCanWeCook
//
//  Created by uics2 on 4/26/13.
//  Copyright (c) 2013 UIHUST. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController
@synthesize webView;
@synthesize menuBT;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url =[NSURL URLWithString:@"http://serv11.divms.uiowa.edu/~ios5/webform/"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
    
    
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    self.menuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBT.frame = CGRectMake(8, 10, 34, 24);
    [menuBT setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBT addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.menuBT];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
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
