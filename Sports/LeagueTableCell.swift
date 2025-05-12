//
//  LeagueTableCell.swift
//  Sports
//
//  Created by Macos on 11/05/2025.
//

import UIKit



class LeagueTableCell: UITableViewCell {

    @IBOutlet weak var innerContainerView: UIView!
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let container = innerContainerView {
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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
