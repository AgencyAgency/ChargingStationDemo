//
//  PDCViewController.m
//  ChargingStationDemo
//
//  Created by koba on 8/24/13.
//  Copyright (c) 2013 Pas de Chocolat, LLC. All rights reserved.
//

#import "PDCViewController.h"
#import "ChargingStationLocation.h"

#define METERS_PER_MILE 1609.344

@interface PDCViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation PDCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadChargingStations];
}

- (NSArray *)fetchChargingStations
{
    NSError *error;
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ev_charging_stations" ofType:@"json"]];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        NSLog(@"Error: Could not fetch charging station data.\n%@", [error localizedDescription]);
        return nil;
    }
    
    NSMutableArray *stations = [NSMutableArray arrayWithCapacity:[json count]];
    [json enumerateObjectsUsingBlock:^(NSDictionary *jsonLoc, NSUInteger idx, BOOL *stop) {
        NSString *name = [jsonLoc objectForKey:@"station_name"];
        NSString *description = [jsonLoc objectForKey:@"location"];
        double latitude = [[jsonLoc valueForKeyPath:@"location_1.latitude"] doubleValue];
        double longitude = [[jsonLoc valueForKeyPath:@"location_1.longitude"] doubleValue];
        ChargingStationLocation *loc = [[ChargingStationLocation alloc] initWithName:name
                                                                 locationDescription:description
                                                                            latitude:latitude
                                                                            logitude:longitude];
        [stations addObject:loc];
    }];
    return stations;
}

- (void)loadChargingStations
{
    dispatch_queue_t downloadQueue = dispatch_queue_create("charging station loader", NULL);
    dispatch_async(downloadQueue, ^{
        NSArray *stations = [self fetchChargingStations];
        if (stations) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.mapView addAnnotations:stations];
            });
        }
    });
}

#pragma mark - Map Delegates

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate,
                                                                       0.5*METERS_PER_MILE,
                                                                       0.5*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
}

@end
