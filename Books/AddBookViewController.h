//
//  AddBookViewController.h
//  Course Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddBookViewController;

@protocol AddBookViewControllerDelegate <NSObject>
- (void)addBookViewControllerDidCancel:(AddBookViewController *)controller;
- (void)addBookViewControllerDidSave:(AddBookViewController *)controller
                           withTitle:(NSString *)title
                              author:(NSString *)author
                               price:(NSUInteger)price
                              course:(NSString *)course
                                isbn:(NSString *)isbn;
@end

@interface AddBookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (nonatomic, weak) id <AddBookViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *priceInput;
@property (weak, nonatomic) IBOutlet UITextField *authorInput;
@property (weak, nonatomic) IBOutlet UITextField *courseInput;
@property (weak, nonatomic) IBOutlet UITextField *isbnInput;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)titleChange:(id)sender;


@end
