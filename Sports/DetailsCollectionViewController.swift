//
//  DetailsCollectionViewController.swift
//  Sports
//
//  Created by Macos on 11/05/2025.
//

import UIKit

private let nibreuseIdentifier = "detailsNib"

class DetailsCollectionViewController: UICollectionViewController  {
    let sectionTitles = ["upcoming", "latest", "teams"]


    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "DetailsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibreuseIdentifier)
        collectionView.register(
            UINib(nibName: "SectionHeaderView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "SectionHeaderView"
        )

        let layout = UICollectionViewCompositionalLayout{index ,environement in
            if(index==0 || index==2){
                return self.drawHorizotalSection()
                
            }
            else{
                return self.drawVerticalSection()
            }
            
            
        }
        
        self.collectionView.setCollectionViewLayout(layout, animated: true)
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

    
  
    
    func drawVerticalSection() -> NSCollectionLayoutSection{
        
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
    
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let myGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
      
        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 16)
       
        let section = NSCollectionLayoutSection(group: myGroup)
        //section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(44)
            )
            
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    

    
    
    func drawHorizotalSection() -> NSCollectionLayoutSection{
        
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
       
        let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
     
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
       
        let myGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 4)
    
        let section = NSCollectionLayoutSection(group: myGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(44)
            )
            
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            section.boundarySupplementaryItems = [sectionHeader]
        //------ animation ----
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }

        }
      
        return section
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
    
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.borderColor = UIColor("#1560BD").cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 14
        cell2.layer.borderColor = UIColor("#1560BD").cgColor
        cell2.layer.borderWidth = 1
        cell2.layer.cornerRadius = 14
        
        
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
