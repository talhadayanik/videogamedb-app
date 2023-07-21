//
//  NetworkConstants.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
        get {
            return ""
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.rawg.io/api/games"
        }
    }
    
}
