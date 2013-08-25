//
//  PDCViewController.m
//  ChargingStationDemo
//
//  Created by koba on 8/24/13.
//  Copyright (c) 2013 Pas de Chocolat, LLC. All rights reserved.
//

#import "PDCViewController.h"

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
    [self.mapView setCenterCoordinate:userLocation.coordinate
                             animated:YES];
}

@end
