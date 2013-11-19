//
//  EditBookViewController.m
//  Course Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "EditBookViewController.h"
#import "SimpleBookManager.h"

@interface EditBookViewController ()

@end

@implementation EditBookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setBookDisplay];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender
{
    [self.delegate editBookViewControllerDidCancel];
}

- (IBAction)done:(id)sender
{
    [[SimpleBookManager sharedBookManager] editBook:_book
                                              title:_titleInput.text
                                             author:_authorInput.text
                                              price:(NSUInteger)[_priceInput.text integerValue]
                                             course:_courseInput.text
                                               isbn:_isbnInput.text];
    [self.delegate editBookViewControllerDidSave];
}

- (void)setBookDisplay
{
    _titleInput.text = _book.title;
    _authorInput.text = _book.author;
    _priceInput.text = [[NSString alloc] initWithFormat:@"%lu", (unsigned long)_book.price];
    _courseInput.text = _book.course;
    _isbnInput.text = _book.isbn;
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
