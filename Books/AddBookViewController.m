//
//  AddBookViewController.m
//  Course Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "AddBookViewController.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _doneButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender
{
    [self.delegate addBookViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    NSString *title = _titleInput.text;
    NSString *author = _authorInput.text;
    NSUInteger price = (NSUInteger)[_priceInput.text integerValue];
    NSString *course = _courseInput.text;
    NSString *isbn = _isbnInput.text;
    
    [self.delegate addBookViewControllerDidSave:self withTitle:title author:author price:price course:course isbn:isbn];
}

- (IBAction)titleChange:(id)sender {
    if (_titleInput.text.length > 0)
    {
        _doneButton.enabled = YES;
    } else {
        _doneButton.enabled = NO;
    }
}

@end
