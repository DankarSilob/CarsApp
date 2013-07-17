//
//  CarsMapViewController.m
//  CarsApp
//
//  Created by Enrique Haro on 7/9/13.
//  Copyright (c) 2013 code3e. All rights reserved.
//

#import "CarsMapViewController.h"

@interface CarsMapViewController ()

@end

@implementation CarsMapViewController
@synthesize myMapView, locationsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    myMapView.delegate = self;
    myMapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomMethod:(id)sender {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(myMapView.userLocation.location.coordinate, 2000, 2000);
    [myMapView setRegion:region];
}

- (IBAction)changeMapType:(id)sender {
    if (myMapView.mapType == MKMapTypeStandard) {
        myMapView.mapType = MKMapTypeSatellite;
    }else{
        myMapView.mapType = MKMapTypeStandard;
    }
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
   
}

- (IBAction)getLocations:(id)sender {
    NSMutableDictionary *chevyDic = [[NSMutableDictionary alloc] init];
    [chevyDic setObject:@"Chevy Volt" forKey:@"Title"];
    [chevyDic setObject:@"Alfonso Reyes Esq N.L" forKey:@"Address"];
    [chevyDic setObject:@"19.406292" forKey:@"latitude"];
    [chevyDic setObject:@"-99.172098" forKey:@"longitud"];
    
    NSMutableDictionary *miniDic = [[NSMutableDictionary alloc] init];
    [miniDic setObject:@"BMW" forKey:@"Title"];
    [miniDic setObject:@"Metrobus Escandon" forKey:@"Address"];
    [miniDic setObject:@"19.404430" forKey:@"latitude"];
    [miniDic setObject:@"-99.173863" forKey:@"longitud"];
    
    locationsArray = [[NSMutableArray alloc] initWithObjects:chevyDic, miniDic, nil];
    for (int i = 0; i<locationsArray.count; i++) {
        [self addCarLocationToMap:locationsArray[i]];
    }
}


-(void)addCarLocationToMap:(NSDictionary *)carDictionary{
    
    CLLocationCoordinate2D carLocation;
    carLocation.latitude = [carDictionary[@"latitude"] floatValue];
    carLocation.longitude = [carDictionary[@"longitud"] floatValue];
    
    MKPointAnnotation *carAnnotation = [[MKPointAnnotation alloc] init];
    carAnnotation.title = carDictionary[@"Title"];
    carAnnotation.subtitle = carDictionary[@"Address"];
    carAnnotation.coordinate = carLocation;
    [myMapView addAnnotation:carAnnotation];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *carView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinLocation"];
    carView.canShowCallout = YES;
    carView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return carView;
    
}


@end














