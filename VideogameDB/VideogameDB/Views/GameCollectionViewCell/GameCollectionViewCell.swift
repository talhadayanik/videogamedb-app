//
//  GameCollectionViewCell.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import UIKit
import SDWebImage

class GameCollectionViewCell: UICollectionViewCell {

    //MARK: -IBOutlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseAndRatingLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    
    static var identifier: String {
        get {
            "GameCollectionViewCell"
        }
    }
    
    static var cellHeight: Float {
        get {
            104
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "GameCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.round()
        containerView.addBorder(color: .lightGray, width: 1)
        
        gameImageView.round(5)
    }
    
    func setupCell(viewModel: GameCollectionCellViewModel) {
        self.nameLabel.text = viewModel.name
        self.releaseAndRatingLabel.text = viewModel.releaseAndRating
        self.gameImageView.sd_setImage(with: viewModel.image)
    }
}
