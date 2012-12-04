//
//  ViewController.h
//  MapMe
//
//  Created by Kevin Y. Kim on 11/28/12.
//  Copyright (c) 2012 kykim, inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)go:(id)sender;

@end
