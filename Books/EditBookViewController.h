//
//  EditBookViewController.h
//  Course Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@class EditBookViewController;

@protocol EditBookViewControllerDelegate <NSObject>
- (void)editBookViewControllerDidCancel:(EditBookViewController *)controller;
- (void)editBookViewControllerDidSave:(EditBookViewController *)controller
                                book:(Book*) book
                           withTitle:(NSString *)title
                              author:(NSString *)author
                               price:(NSUInteger)price
                              course:(NSString *)course
                                isbn:(NSString *)isbn;
@end

@interface EditBookViewController : UIViewController

@property (nonatomic, weak) id <EditBookViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *authorInput;
@property (weak, nonatomic) IBOutlet UITextField *priceInput;
@property (weak, nonatomic) IBOutlet UITextField *courseInput;
@property (weak, nonatomic) IBOutlet UITextField *isbnInput;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (strong, nonatomic) Book *book;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

- (void)setBookDisplay;
- (IBAction)titleChange:(id)sender;


@end
