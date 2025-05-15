import UIKit
private let nibreuseIdentifier = "detailsNib"
private let nibTeamreuseIdentifier = "teamCell"

class DetailsCollectionViewController: UICollectionViewController {
    //var leaguesDetailsArray: [LeaguesDetails] = []
    var upcomingEvents: [LeaguesDetails] = []
    var latestEvents: [LeaguesDetails] = []
   // var teams: [TeamModel] = []
//    var sportType = "football"
//    var leaguesKey = "207"
    var sportType = "basketball"
    var leaguesKey = "41223"
    var leaguesDetailsPresenter: LeaguesDetailsPresenter!
    
    let sectionTitles = ["upcoming", "latest", "teams"]
    var itemFunc = Utils()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaguesDetailsPresenter = LeaguesDetailsPresenter()
        leaguesDetailsPresenter.attachTableView(collectionView: self)
        leaguesDetailsPresenter.getDataFromModel(sportType: sportType, leaguesKey: leaguesKey)
        
        self.title = "Leagues Details"
        
        let favoriteImage = UIImage(systemName: "heart.fill")
        let favoriteButton = UIBarButtonItem(image: favoriteImage, style: .plain, target: self, action: #selector(addNew))
        self.navigationItem.rightBarButtonItem = favoriteButton
        
        let nib = UINib(nibName: "DetailsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibreuseIdentifier)
        
        let nibTeam = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        collectionView.register(nibTeam, forCellWithReuseIdentifier: nibTeamreuseIdentifier)
        
        collectionView.register(
            UINib(nibName: "SectionHeaderView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "SectionHeaderView"
        )
        
        let layout = UICollectionViewCompositionalLayout { index, _ in
            switch index {
            case 0:
                return self.itemFunc.drawHorizotalSection()
            case 1:
                return self.itemFunc.drawVerticalSection()
            default:
                return self.itemFunc.drawTeamsSection()
            }
        }
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    @objc func addNew() {
        // Add action implementation here if needed
    }
    func renderToView(result: LeaguesDetailsResponse) {
        let details = result.result ?? []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        
        upcomingEvents = details.filter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: $0.eventDate) {
                return date >= Date()
            }
            return false
        }

        latestEvents = details.filter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: $0.eventDate) {
                return date < Date()
            }
            return false
        }

        collectionView.reloadData()
    }


    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return upcomingEvents.count
        case 1:
            return latestEvents.count
        case 2:
            return 5
         //   return teams.count
        default:
            return 0
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibreuseIdentifier, for: indexPath) as! DetailsCollectionViewCell
            let detail = upcomingEvents[indexPath.row]
            cell.date.text = detail.eventDate
            cell.lable1.text = detail.eventHomeTeam
            cell.image1?.kf.setImage(with: URL(string: detail.homeTeamLogo),
                              placeholder: UIImage(named: "football"))
            cell.lable2.text = detail.eventAwayTeam
            cell.image2?.kf.setImage(with: URL(string: detail.awayTeamLogo),
                              placeholder: UIImage(named: "football"))

            cell.time.text=detail.eventTime

            styleCell(cell)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibreuseIdentifier, for: indexPath) as! DetailsCollectionViewCell
            let detail = latestEvents[indexPath.row]
            cell.date.text = detail.eventDate
            cell.lable1.text = detail.eventHomeTeam
            cell.image1?.kf.setImage(with: URL(string: detail.homeTeamLogo),
                              placeholder: UIImage(named: "football"))
            cell.lable2.text = detail.eventAwayTeam
            cell.image2?.kf.setImage(with: URL(string: detail.awayTeamLogo),
                              placeholder: UIImage(named: "football"))

            cell.time.text=detail.eventTime
            styleCell(cell)
            return cell
            
        case 2:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: nibTeamreuseIdentifier, for: indexPath) as! TeamCollectionViewCell
//            let team = teams[indexPath.row]
//            cell2.teamNameLabel.text = team.name // افترض وجود label
            styleCell(cell2)
            return cell2
            
        default:
            fatalError("Unexpected section")
        }
    }
    
    func styleCell(_ cell: UICollectionViewCell) {
        cell.layer.borderColor = UIColor(hex: "#074276")?.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 14
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
            
            header.headerLable.text = sectionTitles[indexPath.section]
            return header
        }
        return UICollectionReusableView()
    }
}
