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

@property (strong, nonatomic) UIAlertView * alertView;

@end

@implementation BMWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //all callbacks for locationManager in this class
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = 100.0;
    self.locationManager.distanceFilter = 1000.0;
    [self.locationManager startMonitoringSignificantLocationChanges];
    
    //manage initial map
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    //Let's be honest. Satellite/natural view MUCH more interesting than map view
    self.mapView.mapType = MKMapTypeSatellite;
    
    //Alert view initializations
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Turn on LocationServices to Use this App" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Exit", nil];
    self.alertView.delegate = self;
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
    
    //Labels, with latitude/longitude markings to two decimal places
    pin.title = @"You were here";
    float lat = location.coordinate.latitude;
    float lon = location.coordinate.longitude;
    pin.subtitle = [NSString stringWithFormat: @"lat: ~%f, lon: ~%f", lat, lon];
    
    //Add pin to map, update center of screen to here; resizes zoom at every update
    [self.mapView addAnnotation:pin];
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    CLLocationCoordinate2D newCenter;
    newCenter.latitude = location.coordinate.latitude;
    newCenter.longitude = location.coordinate.longitude;
    region.span = span;
    region.center = newCenter;
    [self.mapView setRegion:region animated:YES];
}

- (void) mapView:(MKMapView *)mapView2 didUpdateUserLocation:(MKUserLocation *)userLocation {
    //If user updates location, then do the following...

}

- (void) stopUpdating
{
    [self.locationManager stopMonitoringSignificantLocationChanges];
}

- (void) resumeUpdating
{
    [self.locationManager startMonitoringSignificantLocationChanges];
}


- (BOOL) isLocationOn
{
    if (kCLAuthorizationStatusAuthorized == [CLLocationManager authorizationStatus]) {
        return TRUE;
    }
    else {
//        self.alertView.
        return FALSE;
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
    } else {
        
    }
}

@end








