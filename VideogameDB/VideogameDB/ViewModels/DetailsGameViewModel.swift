//
//  DetailsGameViewModel.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 20.07.2023.
//

import Foundation

class DetailsGameViewModel {
    
    var gameData: GetGameDetailsModel
    
    var gameImage: URL?
    var gameName: String
    var gameDescription: String
    var gameId: Int
    
    init(game: GetGameDetailsModel) {
        self.gameData = game
        
        self.gameId = game.id
        self.gameName = game.name
        self.gameDescription = game.description
        self.gameImage = URL(string: "\(game.backgroundImage)")
    }
}
