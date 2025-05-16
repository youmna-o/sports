//
//  ViewController.swift
//  Sports
//
//  Created by Macos on 10/05/2025.
//

import UIKit
extension UIColor {
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") { cString.removeFirst() }
        guard cString.count == 6 else { return nil }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

private let reuseIdentifier = "sportCell"

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var result: LeaguesDetailsResponse?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 16
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing
        let sectionInsets = CGFloat(30 * 2) 
        let availableWidth = collectionView.bounds.width - totalSpacing - sectionInsets
        let itemWidth = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemWidth, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsCollectionViewCell
       // var color1 = hexStringToUIColor(hex:"#d3d3d3")
        cell.layer.borderColor = UIColor(hex: "#074276")?.cgColor
        cell.layer.borderWidth = 1.3
        cell.layer.cornerRadius = 20
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
            cell.sportName.text = "tennis"

        default:
           cell.sportImage.image=UIImage(named: "football")
        }
        print("************************")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesScreen") as! LeaguesTableViewController
        switch indexPath.row{
          case 0:
            secondViewController.sportType = "football"
           case 1:
            secondViewController.sportType = "basketball"
            case 2:
            secondViewController.sportType = "cricket"
            case 3:
            secondViewController.sportType = "tennis"
            
        default:
            secondViewController.sportType = "football"

        }
      //  secondViewController.movie = moviesList[indexPath.row]

        self.navigationController?.pushViewController(secondViewController, animated: true)

    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅ ViewDidLoad reached")

        collectionView.delegate = self
        collectionView.dataSource = self
        
//        fetchDataFromJSON { response in
//            DispatchQueue.main.async {
//                if let data = response {
//                    self.result = data
//                    print("✅ Data fetched successfully: \(data)")
//
//                    print("Number of results: \(data.result?.count ?? 0)")
//
//                    // self.collectionView.reloadData()
//                } else {
//                    print("❌ Failed to fetch or decode data")
//                }
//            }
//        }

    }

//    func fetchDataFromJSON(completionHandler: @escaping (LeaguesDetailsResponse?) -> Void) {
//        let urlString = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=0e577c9dd1e799ad376e436f569ed8f787aa178035c782cc6921d2f58af172ab&from=2025-05-13&to=2025-05-17&leagueId=207"
//
//        guard let url = URL(string: urlString) else {
//            print("❌ Invalid URL")
//            completionHandler(nil)
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("❌ Error during request: \(error.localizedDescription)")
//                completionHandler(nil)
//                return
//            }
//
//            guard let data = data else {
//                print("❌ No data received")
//                completionHandler(nil)
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(LeaguesDetailsResponse.self, from: data)
//                completionHandler(decodedData)
//            } catch {
//                print("❌ Decoding error: \(error)")
//                completionHandler(nil)
//            }
//        }
//
//        task.resume()
//    }
         


}

