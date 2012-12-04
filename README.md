CoreLocation_MapKit
===================

Presentation &amp; Project files for lecture given to CUNY Scholars Program 2012-11-28

## Files
**CoreLocation_MapMe.key** - Presentation Slides in Keynote format
**CoreLocation_MapMe.pdf** - Presentation Slides in PDF format
**MapMe** - Demo Project (Xcode 4.5 project)
**capitals.plist** - Property List of US State Capitals

## Exercise
1. Parse *capitals.plist* and use the information to place a pin annotation for each capital.

To parse the plist into an NSArray, use the following:

```objective-c
NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"capitals" ofType:@"plist"];
NSArray *capitalsArray = [NSArray arrayWithContentsOfFile:plistPath];
```

`capitalsArray` will be an `NSArray` of `NSDictionary`

2. Put the State & Capital in the Annotation Callout.
