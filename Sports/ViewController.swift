//
//  ViewController.swift
//  Sports
//
//  Created by Macos on 10/05/2025.
//

import UIKit
extension UIColor {
  
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000")
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
private let reuseIdentifier = "sportCell"

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 200)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCollectionViewCell
       // var color1 = hexStringToUIColor(hex:"#d3d3d3")
        cell.layer.borderColor = UIColor("#1560BD").cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 14
        switch(indexPath.row){
        case 0:
            cell.sportImage.image=UIImage(named: "football")
            cell.sportName.text = "football"
        case 1:
            cell.sportImage.image=UIImage(named: "basketball")
            cell.sportName.text = "basketball"
        case 2:
            cell.sportImage.image=UIImage(named: "cricket")
            cell.sportName.text = "cricket"
        case 3:
            cell.sportImage.image=UIImage(named: "ice-hockey")
            cell.sportName.text = "hockey"

        default:
            cell.sportImage.image=UIImage(named: "football")
        }
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

