//
//  ChargingStationLocation.h
//  ChargingStationDemo
//
//  Created by koba on 8/25/13.
//  Copyright (c) 2013 Pas de Chocolat, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ChargingStationLocation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name locationDescription:(NSString*)locationDescription latitude:(double)latitude logitude:(double)longitude;
- (NSString *)title;
- (NSString *)subtitle;

@end
