//
//  VideoEmbed.h
//  WebView
//
//  Created by uics2 on 4/17/13.
//  Copyright (c) 2013 Jathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoEmbed : UIViewController<UIWebViewDelegate>

@property (nonatomic, retain) IBOutlet UIWebView * thumbnailView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSpinning;

- (IBAction)backHandler:(UIBarButtonItem *)sender;

- (IBAction)refreshHandler:(UIBarButtonItem *)sender;

@end
