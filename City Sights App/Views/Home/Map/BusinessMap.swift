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
    @Binding var selectedBusiness: Business?
    
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
        mapView.delegate = context.coordinator
        
        
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
    
    // MARK: - Coordinator class
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // If the annotation is the user vlue dot, return nil
            if annotation is MKUserLocation {
                return nil
            }
            
            // Check if there is a reuseable annotation first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                
                // Create a new one
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                
            }
            
            else {
                // We got a reuseable one
                annotationView!.annotation = annotation
            }
            
            // Return it
            return annotationView
            
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            // User tapped on the annotation view
            
            // Get the business object that this annotation represents
            
            // Loop through businesses in the mdoel and find a match
            for business in map.model.restaurants + map.model.sights {
                
                if business.name == view.annotation?.title {
                    
                    // Set the selected business property to that business object
                    map.selectedBusiness = business
                    return
                }
            }
        }
    }
}
