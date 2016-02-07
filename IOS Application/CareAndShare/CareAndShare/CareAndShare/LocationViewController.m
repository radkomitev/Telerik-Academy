#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController() <MKMapViewDelegate> {
    
    __weak IBOutlet MKMapView *myMapView;
    
    __weak IBOutlet UILabel *textLocation;
    
    CLLocationManager *locationManager;
    
}

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Location";
    
    myMapView.showsUserLocation = YES;
    myMapView.showsBuildings = YES;
    
    locationManager = [[CLLocationManager alloc] init];
    if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [locationManager requestWhenInUseAuthorization];
    }
    
    [locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:userLocation.coordinate fromEyeCoordinate: CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude) eyeAltitude:10];
    
    [mapView setCamera:camera animated:YES];
    textLocation.text = [NSString stringWithFormat:@"%f",userLocation.coordinate.latitude];

}

@end
