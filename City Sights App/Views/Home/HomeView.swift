//
//  HomeView.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/13/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                
                // Determine if we should show list or map
                if !isMapShowing {
                    // show list
                    
                    VStack (alignment: .leading) {
                        
                        HStack {
                            
                            Image(systemName: "location")
                            
                            Text("San Francisco")
                            
                            Spacer()
                            
                            Button  {
                                self.isMapShowing = true
                            } label: {
                                Text("Switch to Map View")
                            }

                        }
                        Divider()
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            
                            // Create a business detail view instance
                            // Pass in the selected business
                            BusinessDetail(business: business)
                        }
                }
            }
        }
        else {
            // Still waiting for data so show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
