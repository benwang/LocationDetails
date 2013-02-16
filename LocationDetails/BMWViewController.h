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


@interface BMWViewController : UIViewController <CLLocationManagerDelegate>//protocol declaration
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void) stopUpdating;

- (void) resumeUpdating;

@end
