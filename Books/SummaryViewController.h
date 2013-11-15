//
//  SecondViewController.h
//  Books
//
//  Created by Rostislav Raykov on 11/15/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleBookManager.h"

@interface SummaryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bookCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLabel;
@property (weak, nonatomic) IBOutlet UILabel *mostExpensiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *cheapestLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;

@end
