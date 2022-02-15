//
//  BusinessList.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/13/22.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]){
                
                // Create section for restaurants
                BusinessSection(title: "Restaurants", businesses: model.restaurants)
                
                // Create section for sights
                BusinessSection(title: "Sights", businesses: model.sights)
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
