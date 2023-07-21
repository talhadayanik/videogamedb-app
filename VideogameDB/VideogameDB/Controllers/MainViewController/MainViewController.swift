//
//  MainViewController.swift
//  MovieDetailsMVVM
//
//  Created by Sajjad Sarkoobi on 26.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var gamesDataSource: [GameCollectionCellViewModel] = []
    var selectedGame: GetGameDetailsModel? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }
    
    func configView() {
        self.view.backgroundColor = .systemBackground
        self.setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.games.bind { [weak self] games in
            guard let self = self,
                  let games = games else {
                return
            }
            self.gamesDataSource = games
            self.reloadCollectionView()
        }
        
        viewModel.selectedGameData.bind{ [weak self] game in
            guard let self = self,
                  let game = game else {
                return
            }
            self.selectedGame = game
            openDetails()
        }
    }
    
    func getDetails(gameId: Int){
        viewModel.getGameDetails(withId: gameId)
    }
    
    func openDetails() {
        guard let selectedGame = selectedGame else {
            return
        }
        
        DispatchQueue.main.async {
            let detailsViewModel = DetailsGameViewModel(game: selectedGame)
            let controller = DetailsGameViewController(viewModel: detailsViewModel)
            
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }
}
