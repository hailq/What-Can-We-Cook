//
//  Precipe.h
//  New
//
//  Created by uicsi5 on 4/9/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
// xyz // yuw

#import <UIKit/UIKit.h>

@interface Precipe : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) UIImage *img;
@property (weak, nonatomic) NSString *introString;
@property (strong, nonatomic) UIButton *menuBT;
@property (strong, nonatomic) NSString *recipeName;
@property (strong, nonatomic) NSString *direction;
@property (strong, nonatomic) NSString *webLink;
@property (strong, nonatomic) NSString *videoLink;


@end
