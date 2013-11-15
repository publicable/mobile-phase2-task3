//
//  DetailViewController.m
//  Course Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        [self setBookDisplay];
    }
}

- (void)setBookDisplay
{
    self.titleLabel.text = [_detailItem title];
    self.authorLabel.text = [_detailItem author];
    self.priceLabel.text = [[NSString alloc] initWithFormat:@"%lu",(unsigned long)[_detailItem price] ];
    self.courseLabel.text = [_detailItem course];
    self.isbnLabel.text = [_detailItem isbn];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editBookSegue"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        EditBookViewController *editBookViewController = [navigationController viewControllers][0];
        
        NSArray *viewControllers = self.navigationController.viewControllers;
        MasterViewController *rootViewController = [viewControllers objectAtIndex:viewControllers.count - 2];
        
        editBookViewController.delegate = rootViewController;
        editBookViewController.book = self.detailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setBookDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
