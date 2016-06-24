//
//  DAMapViewController.h
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface DAMapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;

@end
