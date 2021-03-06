//
//  LocationDenied.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/19/22.
//

import SwiftUI

struct LocationDenied: View {
    
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        VStack (spacing: 20){
            Spacer()
            
            Text("Whoops")
                .font(.title)
            
            Text("We need to access your location to provide you with the best sights in the city. Please change your decision at any time in the Settings.")
                .padding()
            
            Spacer()
            
            Button {
                
                // Open Settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    if UIApplication.shared.canOpenURL(url) {
                        // If we can open this settings URL, then open it
                        
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            } label: {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }
                .padding()
            }

            Spacer()
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LocationDenied_Previews: PreviewProvider {
    static var previews: some View {
        LocationDenied()
    }
}
