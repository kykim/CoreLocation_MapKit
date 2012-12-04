//
//  MyAnnotation.m
//  MapMe
//
//  Created by Kevin Y. Kim on 11/28/12.
//  Copyright (c) 2012 kykim, inc. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate = _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _coordinate = coordinate;
    }
    return self;
}

#pragma mark - MKAnnotation Protocol Methods

- (NSString *)title
{
    return NSLocalizedString(@"You are Here!", @"You are Here!");
}

- (NSString *)subtitle
{
    return NSLocalizedString(@"Not Really!", @"Not Really!");    
}

#pragma mark - NSCoder Protocol Methods

- (void)encodeWithCoder:(NSCoder *)aCoder
{
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
    }
    return self;
}
@end
