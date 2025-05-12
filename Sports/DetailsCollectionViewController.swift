//
//  DetailsCollectionViewController.swift
//  Sports
//
//  Created by Macos on 11/05/2025.
//

import UIKit


private let nibreuseIdentifier = "detailsNib"
private let nibTeamreuseIdentifier = "teamCell"

class DetailsCollectionViewController: UICollectionViewController  {
    let sectionTitles = ["upcoming", "latest", "teams"]
    var itemFunc = Utils()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leagues Details"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNew))
        self.navigationItem.rightBarButtonItem = add
        
        let nib = UINib(nibName: "DetailsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibreuseIdentifier)
        
        let nibTeam = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        collectionView.register(nibTeam, forCellWithReuseIdentifier: nibTeamreuseIdentifier)
        
        
        collectionView.register(
            UINib(nibName: "SectionHeaderView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "SectionHeaderView"
            
        )

        let layout = UICollectionViewCompositionalLayout{index ,environement in
            
            switch index{
             case 0 :
                return self.itemFunc.drawHorizotalSection()
            case 1 :
                return self.itemFunc.drawVerticalSection()
                
            default:
                return self.itemFunc.drawTeamsSection()
            }
            
            
        }
        
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }
    @objc func addNew() {
//        let addMovieVC = self.storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        
        //            addMovieVC.p = self
//        self.navigationController?.pushViewController(addMovieVC, animated: true)
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "SectionHeaderView",
                for: indexPath
            ) as! SectionHeaderView
            
            let sectionTitles = ["upcoming", "latest", "teams"]
            header.headerLable.text = sectionTitles[indexPath.section]
            
            return header
        }

        return UICollectionReusableView()
    }

    
  
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibreuseIdentifier, for: indexPath) as! DetailsCollectionViewCell
    
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: nibTeamreuseIdentifier, for: indexPath)
        cell.layer.borderColor = UIColor("#1560BD").cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 14
        cell2.layer.borderColor = UIColor("#1560BD").cgColor
        cell2.layer.borderWidth = 1
        cell2.layer.cornerRadius = 14
//        
//        (cell2.viewWithTag(1) as? UILabel)?.text="hello"
//        if let label = cell.viewWithTag(1) as? UILabel {
//                    label.text = "hello"
//            print("Label updated to hello")
//                }
//
//                if let imageView = cell.viewWithTag(2) as? UIImageView {
//                    imageView.image = UIImage(named: "A")
//                    imageView.layer.cornerRadius = imageView.frame.size.width / 2
//                    imageView.clipsToBounds = true
//                }
        
        
        // Configure the cell
        switch indexPath.section {
        case 0:
            return cell
        case 1:
            return cell
        default:
            return cell2
        }
    
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
