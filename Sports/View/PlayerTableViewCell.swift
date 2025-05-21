//
//  PlayerTableViewCell.swift
//  Sports
//
//  Created by Macos on 12/05/2025.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var playerNumber: UILabel!
    
    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playerPosition: UILabel!
    
    @IBOutlet weak var playerRating: UILabel!
    
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        if let container = innerView {
            container.layer.borderColor = UIColor(hex: "#074276")?.cgColor


            container.layer.borderWidth = 2
            container.layer.cornerRadius = 20
            container.clipsToBounds = true
//            backgroundColor = .clear
//            container.layer.masksToBounds = false
//            container.layer.shadowOpacity = 0.23
//            container.layer.shadowRadius = 4
//            container.layer.shadowOffset = CGSize(width: 0, height: 0)
//            container.layer.shadowColor = UIColor.blue.cgColor

//            contentView.backgroundColor = .white
  //          contentView.layer.cornerRadius = 8
        }


        self.backgroundColor = .clear
        self.contentView.backgroundColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
