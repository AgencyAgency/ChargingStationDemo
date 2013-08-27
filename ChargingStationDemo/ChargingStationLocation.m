//
//  ChargingStationLocation.m
//  ChargingStationDemo
//
//  Created by koba on 8/25/13.
//  Copyright (c) 2013 Pas de Chocolat, LLC. All rights reserved.
//

#import "ChargingStationLocation.h"

@interface ChargingStationLocation ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *locationDescription;
@end

@implementation ChargingStationLocation

- (id)initWithName:(NSString*)name locationDescription:(NSString*)locationDescription latitude:(double)latitude logitude:(double)longitude
{
    if ((self = [super init])) {
        _name = name;
        _locationDescription = locationDescription;
        _coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    }
    return self;
}

- (NSString *)title
{
    return self.name;
}

- (NSString *)subtitle
{
    return self.locationDescription;
}

@end
