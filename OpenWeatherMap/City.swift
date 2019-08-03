//
//  City.swift
//  OpenWeatherMap
//
//  Created by Sarin Swift on 8/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct City: Codable {
    var main: MainObj
}

struct MainObj: Codable {
    var temp: Float
    var tempMin: Float
    var tempMax: Float
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
