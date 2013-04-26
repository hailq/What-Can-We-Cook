//
//  MenuViewController.h
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/8/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
