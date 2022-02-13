//
//  ContentModel.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/13/22.
//

import Foundation
import CoreLocation

class ContentModel: ObservableObject {
    
    var locationManager = CLLocationManager()
    
    init() {
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
        // TODO: Start geolocating the user, after we get permission
        // locationManager.startUpdatingLocation()
    }
    
}
