//
//  TeamDetailsViewController.swift
//  Sports
//
//  Created by Macos on 12/05/2025.
//

import UIKit

class TeamDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var playersArray : [Player] = []
    var sportType : String!
    var teamPlayersPresenter: TeamPlayersPresenter!
    var teamName :String!

    @IBOutlet weak var teamTable: UITableView!
    
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
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func renderToView(result : TeamPlayersResponse){

        //print("All Leagues: \(result.result)")

        playersArray = result.players
        teamTable.reloadData()
        if playersArray.isEmpty {
            print("No leagues found for \(sportType!). Displaying empty table.")
        }
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
        teamPlayersPresenter = TeamPlayersPresenter()
        teamPlayersPresenter.attachTableView(tableView: self)
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
