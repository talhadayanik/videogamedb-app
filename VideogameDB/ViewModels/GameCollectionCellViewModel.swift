//
//  GameCollectionCellViewModel.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import Foundation

class GameCollectionCellViewModel {
    var id: Int
    var name: String
    var releaseAndRating: String
    var image: URL?
    
    init(game: Game) {
        self.id = game.id
        self.name = game.name
        self.releaseAndRating = "\(game.metacritic)/100 - \(game.released)"
        self.image = URL(string: game.backgroundImage)
    }
}
