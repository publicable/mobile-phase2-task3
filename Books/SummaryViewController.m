//
//  SecondViewController.m
//  Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "SummaryViewController.h"
#import "SimpleBookManager.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self refresh];
}

- (void)refresh
{
    SimpleBookManager *bm = [SimpleBookManager sharedBookManager];
    
    _bookCountLabel.text = [[NSString alloc] initWithFormat:@"%d", [bm count]];
    _totalCostLabel.text = [[NSString alloc] initWithFormat:@"%d", [bm totalCost]];
    _averageLabel.text = [[NSString alloc] initWithFormat:@"%.2f", [bm meanPrice]];
    _cheapestLabel.text = [[NSString alloc] initWithFormat:@"%d",  [bm minPrice]];
    _mostExpensiveLabel.text = [[NSString alloc] initWithFormat:@"%d", [bm maxPrice]];
}

@end
