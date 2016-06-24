//
//  DAMapViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAMapViewController.h"

@interface DAMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation DAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    MKCoordinateRegion newRegion;
    
    newRegion.center.latitude = 40.6928;
    newRegion.center.longitude = -73.9903;
    
    newRegion.span.latitudeDelta = .2f;
    newRegion.span.longitudeDelta = .2f;
    
    [self.mapView setShowsPointsOfInterest:NO];
    [self.mapView setRegion:newRegion animated:NO];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
