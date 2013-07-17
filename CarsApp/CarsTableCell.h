//
//  CarsTableCell.h
//  CarsApp
//
//  Created by Victor Haro  on 09/07/13.
//  Copyright (c) 2013 code3e. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarsTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *carMakeLabel;

@property (strong, nonatomic) IBOutlet UILabel *carModelLabel;

@property (strong, nonatomic) IBOutlet UIImageView *carPhoto;

@end
