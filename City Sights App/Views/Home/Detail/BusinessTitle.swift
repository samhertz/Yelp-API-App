//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/17/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            // Business Name
            Text(business.name!)
                .font(.title2)
                .bold()
            
            // Loop thru display dddress
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}
