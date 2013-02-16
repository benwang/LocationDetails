//
//  BMWViewController.m
//  LocationDetails
//
//  Created by Benjamin Wang on 2/11/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWViewController.h"

@interface BMWViewController ()
//where private, default methods are declared; .h is for public methods
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation BMWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    //all callbacks for locationManager in this class
    self.locationManager.delegate = self;
    [self.locationManager startMonitoringSignificantLocationChanges];
    //drops pin only if location changes dramatically
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark = CLLocationManagerDelegate methods;

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:
    (NSArray *) locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"lat: %f, lon: %f", location.coordinate.latitude, location.coordinate.longitude);
    [self addPinToMapAtLocation:location];
}

- (void) addPinToMapAtLocation:(CLLocation *) location
{
    //this is the red pin
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    
    //Labels if I so choose
    pin.title = @"foo";
    pin.subtitle = @"bar";
}

- (void) stopUpdating
{
    [self.locationManager stopUpdatingLocation];
}

- (void) resumeUpdating
{
    [self.locationManager startUpdatingLocation];
}

@end








