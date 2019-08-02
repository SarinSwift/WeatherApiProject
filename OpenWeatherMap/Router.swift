//
//  Router.swift
//  OpenWeatherMap
//
//  Created by Sarin Swift on 8/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

enum Router {
    case getCityWeather(cityName: String)
    
    var scheme: String {
        switch self {
        case .getCityWeather:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getCityWeather:
            return "api.openweathermap.org"
        }
    }
    
    var path: String {
        switch self {
        case .getCityWeather:
            return "/data/2.5/weather"
        }
    }
    
    var paramters: [URLQueryItem] {
        switch self {
        case .getCityWeather(let cityName):
            return [URLQueryItem(name: "q", value: cityName),
                    URLQueryItem(name: "appid", value: Constants.apiKey)]
        }
    }
    
    var method: String {
        switch self {
        case .getCityWeather:
            return "GET"
        }
    }
}
