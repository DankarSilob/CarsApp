//
//  CarsTableCell.m
//  CarsApp
//
//  Created by Victor Haro  on 09/07/13.
//  Copyright (c) 2013 code3e. All rights reserved.
//

#import "CarsTableCell.h"

@implementation CarsTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
