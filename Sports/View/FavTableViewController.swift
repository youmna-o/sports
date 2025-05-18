//
//  FavTableViewController.swift
//  Sports
//
//  Created by Macos on 12/05/2025.
//

import UIKit
import CoreData
import Kingfisher

class FavTableViewController: UITableViewController {

    var context : NSManagedObjectContext!
    var entity : NSEntityDescription!
    var favArr : [LeagueCoreDataModel] = []
    var favPresenter = FavPresenter()

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
        label.text = "Favorites"
        label.textAlignment = .center
       // label.textColor = UIColor(hex: "#1560BD")
        label.font = UIFont.systemFont(ofSize: 24)

        headerView.addSubview(label)

        tableView.tableHeaderView = headerView
        
        favArr = favPresenter.getDataFromModel()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return favArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let nib = UINib(nibName: "LeagueTableCell", bundle: nil)
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueTableCell", for: indexPath) as! LeagueTableCell
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.contentView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 8, right: 0)
        cell.leagueName.text = favArr[indexPath.row].name
        cell.leagueImage.kf.setImage(with: URL(string: favArr[indexPath.row].imageUrl ?? ""), placeholder: UIImage(named: "basketball"))

        return cell
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
