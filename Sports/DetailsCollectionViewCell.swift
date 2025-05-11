//
//  DetailsCollectionViewCell.swift
//  Sports
//
//  Created by Macos on 11/05/2025.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        image1.layer.cornerRadius = image1.frame.width / 2
            image1.layer.masksToBounds = true
            
            image2.layer.cornerRadius = image2.frame.width / 2
            image2.layer.masksToBounds = true
        image1.contentMode = .scaleAspectFill
           image2.contentMode = .scaleAspectFill
        // Initialization code
    }

}
