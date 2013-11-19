//
//  MasterViewController.m
//  Course Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SimpleBookManager.h"

@interface MasterViewController () {

}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[SimpleBookManager sharedBookManager] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Book *book = [[SimpleBookManager sharedBookManager] bookAtIndex:indexPath.row];
    cell.textLabel.text = [book description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Book *book = [[SimpleBookManager sharedBookManager] bookAtIndex:indexPath.row];
        [[SimpleBookManager sharedBookManager] removeBook:book];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Book *book = [[SimpleBookManager sharedBookManager] bookAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:book];
    }
    
    if ([segue.identifier isEqualToString:@"addBookSegue"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddBookViewController *addBookViewController = [navigationController viewControllers][0];
        addBookViewController.delegate = self;
    }
}

#pragma mark - AddBookViewControllerDelegate

- (void)addBookViewControllerDidCancel:(AddBookViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addBookViewControllerDidSave:(AddBookViewController *)controller withTitle:(NSString *)title author:(NSString *)author price:(NSUInteger)price course:(NSString *)course isbn:(NSString *)isbn
{
    [[SimpleBookManager sharedBookManager] createBookWithTitle:title author:author price:price course:course isbn:isbn];
    [self insertNewObject];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - EditBookViewControllerDelegate

- (void)editBookViewControllerDidCancel:(EditBookViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)editBookViewControllerDidSave:(EditBookViewController *)controller book:(Book*)book withTitle:(NSString *)title author:(NSString *)author price:(NSUInteger)price course:(NSString *)course isbn:(NSString *)isbn
{
    [[SimpleBookManager sharedBookManager] editBook:book title:title author:author price:price course:course isbn:isbn];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
