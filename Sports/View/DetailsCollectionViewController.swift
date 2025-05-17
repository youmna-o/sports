import UIKit

private let nibreuseIdentifier = "detailsNib"
private let nibTeamreuseIdentifier = "teamCell"

class DetailsCollectionViewController: UICollectionViewController  {
    var upcomingEvents: [Event] = []
    var latestEvents: [Event] = []
    var teams: [Team] = []
//done
    var sportType = "football"
    var leaguesKey = "207"
    
//    var sportType = "cricket"
//      var leaguesKey = "745"
//
//        var sportType = "basketball"
//          var leaguesKey = "1153"
    
//             var sportType = "tennis"
//             var leaguesKey = "2207"
    //var leaguesKey ="11072"
    
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
    }

    func renderFootball(result: LeaguesDetailsResponse) {
        let details = result.result ?? []
        let events = details.map {
            Event(eventDate: $0.eventDate,
                  eventHomeTeam: $0.eventHomeTeam,
                  eventAwayTeam: $0.eventAwayTeam,
                  homeTeamLogo: $0.homeTeamLogo,
                  awayTeamLogo: $0.awayTeamLogo,
                  eventTime: $0.eventTime)
        }
        renderCommon(details: events)
    }
    
    func renderCricket(result: CricketResponse) {
        let details = result.result ?? []
        let events = details.map {
            Event(eventDate: $0.eventDateStart,
                        eventHomeTeam: $0.eventHomeTeam,
                        eventAwayTeam: $0.eventAwayTeam,
                  homeTeamLogo: $0.eventHomeTeamLogo ?? "",
                  awayTeamLogo: $0.eventAwayTeamLogo ?? "",
                        eventTime: $0.eventTime)
        }
        renderCommon(details: events)
    }
    func renderBasketball(result: BasketballResponse) {
        let details = result.result
        let events = details.map {
            Event(eventDate: $0.eventDate,
                        eventHomeTeam: $0.eventHomeTeam,
                        eventAwayTeam: $0.eventAwayTeam,
                  homeTeamLogo: $0.eventHomeTeamLogo ?? "",
                  awayTeamLogo: $0.eventAwayTeamLogo ?? "",
                        eventTime: $0.eventTime)
        }
        renderCommon(details: events)
   }
    func renderTennis(result: TennisResponse) {
        let matches = result.result
        let events = matches.map {
            Event(
                eventDate: $0.eventDate,
                eventHomeTeam: $0.eventFirstPlayer,
                eventAwayTeam: $0.eventSecondPlayer,
                homeTeamLogo: $0.eventFirstPlayerLogo ?? "",
                awayTeamLogo: $0.eventSecondPlayerLogo ?? "",
                eventTime: $0.eventTime
            )
        }
        renderCommon(details: events)
    }


    
    func renderCommon(details: [Event]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        
        upcomingEvents = details.filter {
            if let date = dateFormatter.date(from: $0.eventDate) {
                return date >= currentDate
            }
            return false
        }
        
        latestEvents = details.filter {
            if let date = dateFormatter.date(from: $0.eventDate) {
                return date < currentDate
            }
            return false
        }
        
        var teamSet = Set<String>()
        teams.removeAll()
        for event in details {
            if !teamSet.contains(event.eventHomeTeam) {
                teamSet.insert(event.eventHomeTeam)
                teams.append(Team(teamName: event.eventHomeTeam, teamLogo: event.homeTeamLogo))
            }
            if !teamSet.contains(event.eventAwayTeam) {
                teamSet.insert(event.eventAwayTeam)
                teams.append(Team(teamName: event.eventAwayTeam, teamLogo: event.awayTeamLogo))
            }
        }
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return upcomingEvents.count
        case 1: return latestEvents.count
        case 2: return teams.count
        default: return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibreuseIdentifier, for: indexPath) as! DetailsCollectionViewCell
            let detail = upcomingEvents[indexPath.row]
            cell.date.text = detail.eventDate
            cell.lable1.text = detail.eventHomeTeam
            cell.image1?.kf.setImage(with: URL(string: detail.homeTeamLogo), placeholder: UIImage(named: "basketball"))
            cell.lable2.text = detail.eventAwayTeam
            cell.image2?.kf.setImage(with: URL(string: detail.awayTeamLogo), placeholder: UIImage(named: "basketball"))
            cell.time.text = detail.eventTime
            styleCell(cell)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibreuseIdentifier, for: indexPath) as! DetailsCollectionViewCell
            let detail = latestEvents[indexPath.row]
            cell.date.text = detail.eventDate
            cell.lable1.text = detail.eventHomeTeam
            cell.image1?.kf.setImage(with: URL(string: detail.homeTeamLogo), placeholder: UIImage(named: "basketball"))
            cell.lable2.text = detail.eventAwayTeam
            cell.image2?.kf.setImage(with: URL(string: detail.awayTeamLogo), placeholder: UIImage(named: "basketball"))
            cell.time.text = detail.eventTime
            styleCell(cell)
            return cell
            
        case 2:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: nibTeamreuseIdentifier, for: indexPath) as! TeamCollectionViewCell
            let team = teams[indexPath.row]
            cell2.name.text = team.teamName
            cell2.img.kf.setImage(with: URL(string: team.teamLogo), placeholder: UIImage(named: "basketball"))
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let selectedTeam = teams[indexPath.row]
            print("Team Name: \(selectedTeam.teamName)")
        }
    }
}
