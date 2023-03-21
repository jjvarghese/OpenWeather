//
//  Weather.swift
//  OpenWeatherSwiftUI
//
//  Created by Joshua Varghese on 21.03.23.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
