//
//  LeaguesTableViewController.swift
//  Sports
//
//  Created by Macos on 11/05/2025.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController {
    var leaguesArray : [League] = []
    var sportType : String!
    var leaguesPresenter: LeaguesPresenter!
    var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LeagueTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "leagueTableCell")
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
        headerView.backgroundColor = .white

        let label = UILabel(frame: headerView.bounds)
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        label.text = "\(sportType.capitalized ?? "") Leagues"
        label.textAlignment = .center
       // label.textColor = UIColor(hex: "#1560BD")
        label.font = UIFont.systemFont(ofSize: 24)

        headerView.addSubview(label)

        tableView.tableHeaderView = headerView
        leaguesPresenter = LeaguesPresenter()
        leaguesPresenter.attachTableView(tableView: self)
        leaguesPresenter.getDataFromModel(sportType: sportType)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func renderToView(result : LeaguesResponse){
        activityIndicator.stopAnimating()
        //print("All Leagues: \(result.result)")

        leaguesArray = result.result
        tableView.reloadData()
        if leaguesArray.isEmpty {
            print("No leagues found for \(sportType!). Displaying empty table.")
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < leaguesArray.count else {
            print("Index out of bounds: \(indexPath.row), leaguesArray count: \(leaguesArray.count)")
            return UITableViewCell() 
        }
      //  let nib = UINib(nibName: "LeagueTableCell", bundle: nil)
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueTableCell", for: indexPath) as! LeagueTableCell
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.contentView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 8, right: 0)
        cell.leagueName.text = leaguesArray[indexPath.row].leagueName
        let url = URL(string: leaguesArray[indexPath.row].leagueLogo ?? "")
        cell.leagueImage?.kf.setImage(with: url,
                                      placeholder: UIImage(named: "league2"),
                                      options: [
                                          .transition(.fade(0.2))
                                      ])        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetails") as!
        DetailsCollectionViewController
        
        secondViewController.sportType = sportType
        secondViewController.leaguesKey = "\([leaguesArray[indexPath.row].leagueKey])"
        secondViewController.leagueLogo = leaguesArray[indexPath.row].leagueLogo
        secondViewController.leagueName = leaguesArray[indexPath.row].leagueName
        //secondViewController.movie = moviesList[indexPath.row]

        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
