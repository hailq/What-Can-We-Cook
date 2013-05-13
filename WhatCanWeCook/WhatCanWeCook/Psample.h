//
//  Psample.h
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "RecipeParser.h"
#import "Recipe.h"
#import "RecipeCustomCell.h"

@interface Psample : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    __weak IBOutlet UIView *buttonView;
    __weak IBOutlet UITableView *recipeTableView;
    NSArray *sortedArray;
}


@property (strong, nonatomic) NSMutableArray *recipeList;
@property (strong, nonatomic) UIButton *menuBT;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) NSString *ingredientsRequest;
@property (strong, nonatomic) NSMutableArray *countriesRequest;
@property (strong, nonatomic) NSMutableArray *categoriesRequest;
@property int sortKind;

@property (weak, nonatomic) IBOutlet UIButton *btnTime;
@property (weak, nonatomic) IBOutlet UIButton *btnRating;
@property (weak, nonatomic) IBOutlet UILabel *noRecipe;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSpinning;
- (IBAction)backHandler:(UIBarButtonItem *)sender;

@end
