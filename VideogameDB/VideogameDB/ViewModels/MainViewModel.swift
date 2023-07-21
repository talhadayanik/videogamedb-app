//
//  MainViewModel.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import Foundation

class MainViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: GetGamesModel?
    var selectedGameData: Observable<GetGameDetailsModel> = Observable(nil)
    var games: Observable<[GameCollectionCellViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        APICaller.getGames { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let getGamesData):
                self?.dataSource = getGamesData
                self?.mapGameData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getGameDetails(withId gameId: Int) {
        if isLoadingData.value ?? true{
            return
        }
        
        isLoadingData.value = true
        APICaller.getGameDetails(gameId: String(gameId)){
            [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let getGameDetailsData):
                self?.selectedGameData.value = getGameDetailsData
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func mapGameData() {
        games.value = self.dataSource?.results.compactMap({GameCollectionCellViewModel(game: $0)})
    }
    
    func getGameName(_ game: Game) -> String {
        return game.name
    }
    
}

