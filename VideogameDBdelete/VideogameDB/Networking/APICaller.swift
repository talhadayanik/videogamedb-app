//
//  APICaller.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getGames(completionHandler: @escaping (_ result: Result<GetGamesModel, NetworkError>) -> Void) {
        if NetworkConstants.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get one from: https://rawg.io/apidocs <!>")
            return
        }
        
        let urlString = NetworkConstants.shared.serverAddress +
                "?key=" +
                NetworkConstants.shared.apiKey
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(GetGamesModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
    static func getGameDetails(gameId: String,completionHandler: @escaping (_ result: Result<GetGameDetailsModel, NetworkError>) -> Void) {
        if NetworkConstants.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get one from: https://rawg.io/apidocs <!>")
            return
        }
        
        let urlString = NetworkConstants.shared.serverAddress +
                "/\(gameId)?key=" +
                NetworkConstants.shared.apiKey
                
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(GetGameDetailsModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
