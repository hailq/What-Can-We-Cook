//
//  Psample.m
//  New
//
//  Created by uicsi5 on 4/6/13.
//  Copyright (c) 2013 uicsi5. All rights reserved.
//modified this file

#import "Psample.h"
#import "Precipe.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@implementation Psample

@synthesize recipeList = recipeList_;
@synthesize menuBT;
@synthesize loadSpinning;
@synthesize panGesture = panGesture_;
@synthesize noRecipe = lblNoRecipe;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // warning here, but it allows the picture to appear
    
    /* Initialize variables */
    if (recipeList_ == nil) {
        recipeList_ = [[NSMutableArray alloc] init];
    }
    
    /* Sliding Menu */
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if(![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]){
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (self.slidingViewController.panGesture != nil) {
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
    
    self.menuBT = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBT.frame = CGRectMake(8, 10, 34, 24);
    [menuBT setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBT addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.slidingViewController.panGesture != nil) {
        [self.view addSubview:self.menuBT];
    }
     
    //End sliding menu
    
    if (self.sortKind != 1) {
        [self.btnRating setSelected:YES];
        [self.btnTime setSelected:NO];
    } else {
        [self.btnRating setSelected:NO];
        [self.btnTime setSelected:YES];
    }
    
    [lblNoRecipe setHidden:YES];
    [loadSpinning setHidesWhenStopped:YES];
    [self requestDataFromServer];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Take top header bar place
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)requestDataFromServer
{
//    [self.view setUserInteractionEnabled:NO];
    /* Parameters */
//    NSDictionary *params =
    
    NSString *requestString = kBaseUrl;
    /* Appeding parameter */
    NSString *categoryString = @"";
    if ([self.categoriesRequest count] > 0) {
        categoryString = [self.categoriesRequest objectAtIndex:0];
        for (int i = 1; i < [self.categoriesRequest count]; i++) {
           categoryString = [categoryString stringByAppendingFormat:@",%@",[self.categoriesRequest objectAtIndex:i]];
        }
    }
    
    NSString *countryString = @"";
    if ([self.countriesRequest count] > 0) {
        countryString = [self.countriesRequest objectAtIndex:0];
        for (int i = 1; i < [self.countriesRequest count]; i++) {
           countryString = [countryString stringByAppendingFormat:@",%@",[self.countriesRequest objectAtIndex:i]];
        }
    }
    
    
    requestString = [requestString stringByAppendingFormat:@"?ingredients=%@",self.ingredientsRequest];
    requestString = [requestString stringByAppendingFormat:@"&categories=%@",categoryString];
    requestString = [requestString stringByAppendingFormat:@"&countries=%@",countryString];
    //
    
    NSLog(@"Request string: %@", requestString);
    
    NSURL *url = [NSURL URLWithString:requestString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                            NSData *data,
                            NSError *error){
        
        if ([data length] > 0 && error == nil) {
            
            NSString *xml = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            RecipeParser *parser = [[RecipeParser alloc] init];
            
            [parser startParser:xml];
        
            if ([[parser recipeArray] count] > 0) {
                [recipeList_ addObjectsFromArray:[parser recipeArray]];
            } else {
                NSLog(@"No recipe");
            }
        }
        else if ([data length] == 0 && error == nil){
            NSLog(@"Nothing was downloaded");
        }
        else if (error != nil)
        {
            NSLog(@"Error happend = %@",error);
        }
     dispatch_async(dispatch_get_main_queue(), ^{
        [self finishedLoadingData];
    });
        
    }];
}

- (void)finishedLoadingData
{
    
    [self.view setUserInteractionEnabled:YES];
    /*
    int numberOfRows = [recipeTableView numberOfRowsInSection:0];

    for (int i = 0; i < [recipeList_ count]; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(numberOfRows + i ) inSection:0];
        
        NSArray *indexArray = [NSArray arrayWithObject:indexPath];
        
        [recipeTableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop];
    }
    */
    [self sortRecipe];
    if ([recipeList_ count] > 0) {
        [recipeTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    } else {
        [lblNoRecipe setHidden:NO];
    }
    [recipeTableView reloadData];
    [loadSpinning stopAnimating];

}

-(void)sortRecipe
{
    if (self.sortKind == 1) {
        [recipeList_ sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            int first = [(Recipe*)obj1 cookTime];
            int second = [(Recipe*)obj2 cookTime];
            return first > second;
        }];
    }//Sort cook time
    
    else {
        [recipeList_ sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            float first = [(Recipe*)obj1 recipeRanking];
            float second = [(Recipe*)obj2 recipeRanking];
            return first < second;
        }];
    }// Sort ranking
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ResultToListSegue"])
    {
        Precipe *recipeDetail = segue.destinationViewController;
        
        NSInteger cellRow = [recipeTableView indexPathForSelectedRow].row;
        
        Recipe *recipe = (Recipe*) [recipeList_ objectAtIndex:cellRow];
        
        recipeDetail.img = [UIImage imageWithData:recipe.recipeImage];
        recipeDetail.recipeName = recipe.recipeName;
        recipeDetail.webLink = recipe.webLink;
        recipeDetail.videoLink = recipe.videoLink;
        recipeDetail.direction = recipe.directions;
        if (recipeDetail.ingredientsArray == nil) {
            recipeDetail.ingredientsArray = [[NSMutableArray alloc] init];
        }
        [recipeDetail.ingredientsArray addObjectsFromArray:recipe.ingredients];
        
        if (recipeDetail.userIngredients == nil) {
            recipeDetail.userIngredients = [[NSMutableArray alloc] init];
        }
        [recipeDetail.userIngredients addObjectsFromArray:[self.ingredientsRequest componentsSeparatedByString:@","]];
        
        recipeDetail.recipeId = recipe.recipeId;
        
    }
}

#pragma mark -
#pragma Button Event Handler

- (IBAction)sortRating:(UIButton *)sender {

    [sender setSelected:YES];
    [self.btnTime setSelected:NO];
    self.sortKind = 0;
    [self finishedLoadingData];
}

- (IBAction)sortTime:(UIButton *)sender {
    
    [self.btnRating setSelected:NO];
    [sender setSelected:YES];
    self.sortKind = 1;
    [self finishedLoadingData];
}

- (IBAction)backHandler:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

#pragma mark Table View Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipeList_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecipeCellIdentifier";
    
    RecipeCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[RecipeCustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.cellRecipeName.text = [recipeList_[indexPath.row] recipeName];
    
    [cell.cellRecipeRating setText:[NSString stringWithFormat:@"Rating: %.1f",[recipeList_[indexPath.row] recipeRanking]]];
    
    [cell.cellRecipeTime setText: [NSString stringWithFormat:@"%d mins",[recipeList_[indexPath.row] cookTime]]];
    
    cell.cellImageView.image = [UIImage imageWithData:[recipeList_[indexPath.row]recipeImage]];
    return cell;
}

@end
