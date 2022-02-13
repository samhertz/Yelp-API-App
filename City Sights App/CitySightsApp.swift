//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/12/22.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
