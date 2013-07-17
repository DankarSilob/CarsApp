//
//  CarsMapViewController.h
//  CarsApp
//
//  Created by Enrique Haro on 7/9/13.
//  Copyright (c) 2013 code3e. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>

@interface CarsMapViewController : UIViewController <MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *myMapView;


- (IBAction)zoomMethod:(id)sender;
- (IBAction)changeMapType:(id)sender;
- (IBAction)getLocations:(id)sender;

@property NSMutableArray *locationsArray;


@end
