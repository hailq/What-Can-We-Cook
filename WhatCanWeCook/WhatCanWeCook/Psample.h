//
//  Psample.h
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Psample : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *recipeList;
@property (strong, nonatomic) UIButton *menuBT;

@end
