//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Samuel Hertz on 2/13/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
