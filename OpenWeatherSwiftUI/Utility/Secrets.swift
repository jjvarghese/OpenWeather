//
//  Secrets.swift
//  OpenWeatherSwiftUI
//
//  Created by Joshua Varghese on 21.03.23.
//

import Foundation

class Secrets {
    
    enum Key: String {
        case apiKey = "apiKey"
    }
    
    static func getSecret(key: Key) -> String {
        var keys: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = keys {
            return dict[key.rawValue] as? String ?? ""
        } else {
            return ""
        }
    }
    
}
