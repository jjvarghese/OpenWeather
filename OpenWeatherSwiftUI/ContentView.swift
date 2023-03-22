//
//  ContentView.swift
//  OpenWeatherSwiftUI
//
//  Created by Joshua Varghese on 21.03.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    init() {
        self.weatherViewModel = WeatherViewModel()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("What's the weather like today?")
            TextField("Enter city name", text: $weatherViewModel.cityName) {
                weatherViewModel.search()
            }
            
            weatherViewModel.temperature.count > 0 ?
            Text("The temperature is \(weatherViewModel.temperature) degrees celcius in \(weatherViewModel.cityName) today")
            : nil
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
