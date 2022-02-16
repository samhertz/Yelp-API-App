//
//  BusinessMap.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/15/22.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations: [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        // Create a set on annotations from our list of businesses
        for business in model.restaurants + model.sights{
            
            // If the business has a latitude and longitude, create an MKPointAnnotation for it
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                // Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
                
            }
        }
        return annotations
    }
    
    // Create UIView
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        // Make the user show up on map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
    
    // Updates, and allows changes to View
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add annotations based on business
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    
    // No longer needed. Used to clean up view
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
        
    }
    
}
