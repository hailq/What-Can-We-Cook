//
//  HavingTableViewCell.h
//  WhatCanWeMake_datdh
//
//  Created by hust9 on 4/8/13.
//  Copyright (c) 2013 hust9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HavingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UILabel *unit;
@property (weak, nonatomic) IBOutlet UILabel *ingredient;

@end
