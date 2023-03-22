//
//  WeatherService.swift
//  OpenWeatherSwiftUI
//
//  Created by Joshua Varghese on 21.03.23.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String,
                    completion: @escaping (Weather?) -> ()) {
        let urlString = "http://api.openweathermap.org/data/2.5/weather?appid=\(Secrets.getSecret(key: .apiKey))&q=\(city)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse {
                let weather = weatherResponse.main
                
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
            
    }
}
