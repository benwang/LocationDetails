//
//  BMWViewController.h
//  LocationDetails
//
//  Created by Benjamin Wang on 2/11/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface BMWViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UIAlertViewDelegate>//protocol declaration
@property (strong, nonatomic) IBOutlet MKMapView *mapView;



- (void) stopUpdating;

- (void) resumeUpdating;

- (BOOL) isLocationOn;

- (void) showAlert;

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
