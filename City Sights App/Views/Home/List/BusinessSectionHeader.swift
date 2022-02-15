//
//  BusinessSectionHeader.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/13/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack (alignment: .leading){
            
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
            
        }
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}
