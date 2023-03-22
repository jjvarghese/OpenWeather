//
//  WeatherViewModel.swift
//  OpenWeatherSwiftUI
//
//  Created by Joshua Varghese on 21.03.23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        weatherService.getWeather(city: city) { weather in
            if let weather {
                DispatchQueue.main.async { [weak self] in
                    self?.weather = weather
                }
            }
        }
    }
    
}
