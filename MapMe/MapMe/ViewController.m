//
//  ViewController.m
//  MapMe
//
//  Created by Kevin Y. Kim on 11/28/12.
//  Copyright (c) 2012 kykim, inc. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"

@interface ViewController ()
@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLPlacemark *placemark;

- (void)reverseGeocode:(CLLocation *)location;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.mapType = MKMapTypeStandard;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(id)sender
{
    if (self.manager == nil)
        self.manager = [[CLLocationManager alloc] init];
    
    self.manager.delegate = self;
    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.manager startUpdatingLocation];
}

- (void)reverseGeocode:(CLLocation *)location
{
    if (self.geocoder == nil)
        self.geocoder = [[CLGeocoder alloc] init];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray* placemarks, NSError* error) {
        if (error != nil) {
            NSLog(@"Error Reverse Geocoding: %@", [error localizedDescription]);
        }
        else if ([placemarks count] > 0) {
            self.placemark = [placemarks objectAtIndex:0];
            MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinate:location.coordinate];
            [self.mapView addAnnotation:annotation];
        }
    }];
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)aManager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if ([newLocation.timestamp timeIntervalSince1970] < [NSDate timeIntervalSinceReferenceDate] - 60)
        return;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 2000, 2000);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    aManager.delegate = nil;
    [aManager stopUpdatingLocation];
        
    [self reverseGeocode:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error Getting Location: %@", [error localizedDescription]);
}

#pragma mark - MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *placemarkIdentifier = @"Map Location Identifier";
    
    if ([annotation isKindOfClass:[MyAnnotation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[aMapView dequeueReusableAnnotationViewWithIdentifier:placemarkIdentifier];
        // uncomment following for iOS 5
//        if (nil == annotationView) {
//            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
//                                                             reuseIdentifier:placemarkIdentifier];
//        }
//        else
            annotationView.annotation = annotation;
        
        annotationView.enabled = YES;
        annotationView.animatesDrop = YES;
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.canShowCallout = YES;
        
        return annotationView;
    }
    return nil;
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)aMapView withError:(NSError *)error
{
    NSLog(@"Error Loading Map: %@", [error localizedDescription]);
}

@end
