//
//  ViewController.h
//  WebView
//
//  Created by uics2 on 4/16/13.
//  Copyright (c) 2013 Jathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSpinning;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *webLink;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) NSString *direction;

- (IBAction)backHandle:(UIBarButtonItem *)sender;

- (IBAction)refreshHandler:(UIBarButtonItem *)sender;

@end
