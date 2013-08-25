//
//  PDCViewController.m
//  ChargingStationDemo
//
//  Created by koba on 8/24/13.
//  Copyright (c) 2013 Pas de Chocolat, LLC. All rights reserved.
//

#import "PDCViewController.h"

#define METERS_PER_MILE 1609.344

@interface PDCViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation PDCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Map Delegates

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate,
                                                                       0.5*METERS_PER_MILE,
                                                                       0.5*METERS_PER_MILE);
    [_mapView setRegion:viewRegion animated:YES];
}

@end
