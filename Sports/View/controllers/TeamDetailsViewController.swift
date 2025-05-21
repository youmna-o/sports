//
//  TeamDetailsViewController.swift
//  Sports
//
//  Created by Macos on 12/05/2025.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var playersArray : [Player] = []
    var sportType : String!
    var teamPlayersPresenter: TeamPlayersPresenter!
    var teamName :String!
    var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var coachName: UILabel!
    
    @IBOutlet weak var teamTable: UITableView!
    
    @IBOutlet weak var teamLogo: UIImageView!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playersArray.count
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTableCell", for: indexPath) as! PlayerTableViewCell
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.contentView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 8, right: 0)
        cell.playerName.text = playersArray[indexPath.row].playerName
        cell.playerNumber.text = "No.\(playersArray[indexPath.row].playerNumber)"
        if(playersArray[indexPath.row].playerRating == "")
        {
            cell.playerRating.text = "unavaliable"
            
        }else{
            cell.playerRating.text = playersArray[indexPath.row].playerRating
        }
        cell.playerPosition.text = playersArray[indexPath.row].playerType.rawValue
        cell.playerImage?.kf.setImage(with: playersArray[indexPath.row].playerImage,
                                      placeholder: UIImage(named: "playerPlaceholder"),
                                      options: [
                                          .transition(.fade(0.2))
                                      ])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func renderToView(result : TeamPlayersResponse){
        activityIndicator.stopAnimating()
        //print("All Leagues: \(result.result)")
        coachName.text = result.result[0].coaches[0].coachName
        teamNameLabel.text = result.result[0].teamName
        playersArray = result.result[0].players
//        let imageURL = URL(string: result.result[0].teamLogo ?? "")
        teamLogo?.kf.setImage(with: result.result[0].teamLogo,
                              placeholder: UIImage(named: "league2"),
                              options: [
                                  .transition(.fade(0.2))
                              ])
        teamTable.reloadData()
        if playersArray.isEmpty {
            print("No leagues found for \(sportType!). Displaying empty table.")
        }
    }
    func showFetchErrorAlert() {
        let alert = UIAlertController(title: "No Team Details", message: "No details are available for this team.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PlayerTableViewCell", bundle: nil)
        teamTable.register(nib, forCellReuseIdentifier: "TeamTableCell")
        teamTable.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        teamTable.backgroundColor = UIColor.white
        teamTable.separatorStyle = .none
        teamTable.delegate = self
        teamTable.dataSource = self
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        teamPlayersPresenter = TeamPlayersPresenter()
        teamPlayersPresenter.attachTableView(tableView: self)
        print("Calling getDataFromModel with sportType=\(sportType ?? "nil"), teamName=\(teamName ?? "nil")")

        teamPlayersPresenter.getDataFromModel(sportType: sportType, teamName: teamName)
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
//        headerView.backgroundColor = .white
//
//        let label = UILabel(frame: headerView.bounds)
//        label.text = "Football Leagues"
//        label.textAlignment = .center
//       // label.textColor = UIColor(hex: "#1560BD")
//        label.font = UIFont.systemFont(ofSize: 24)
//
//        headerView.addSubview(label)
//
//        tableView.tableHeaderView = headerView

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
