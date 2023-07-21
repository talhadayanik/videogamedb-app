//
//  DetailsGameViewController.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 20.07.2023.
//

import UIKit
import SDWebImage

class DetailsGameViewController: UIViewController {

    //MARK: -Outlets
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //View model
    var viewModel: DetailsGameViewModel
    
    init(viewModel: DetailsGameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsGameViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        self.title = "Game Details"
        nameLabel.text = viewModel.gameName
        gameImageView.sd_setImage(with: viewModel.gameImage)
        descriptionLabel.text = viewModel.gameDescription
    }
}
