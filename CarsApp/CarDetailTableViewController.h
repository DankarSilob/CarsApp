//
//  CarDetailTableViewController.h
//  CarsApp
//
//  Created by Victor Haro  on 09/07/13.
//  Copyright (c) 2013 code3e. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarDetailTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *carMakeDetail;
@property (strong, nonatomic) IBOutlet UILabel *carModelDetail;
@property (strong, nonatomic) IBOutlet UIImageView *carPhotoDetail;
@property NSArray *infoCarArray;

@end
