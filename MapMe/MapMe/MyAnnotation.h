//
//  MyAnnotation.h
//  MapMe
//
//  Created by Kevin Y. Kim on 11/28/12.
//  Copyright (c) 2012 kykim, inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation, NSCoding>

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
