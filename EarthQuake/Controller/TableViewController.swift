//
//  TableViewController.swift
//  EarthQuake
//
//  Created by daicudu on 12/26/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var quakeInfos: [QuakeInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        DataServices.share.getDataQuake { [unowned self] quakeInfo in
            self.quakeInfos = quakeInfo
            self.tableView.reloadData()
        }

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quakeInfos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cricleLabel.text = String(describing: quakeInfos[indexPath.row].mag)
        cell.distanceLabel.text = quakeInfos[indexPath.row].distanceString
        cell.locationLabel.text = quakeInfos[indexPath.row].locationName
        cell.dateLabel.text = quakeInfos[indexPath.row].dateString
        cell.timeLabel.text = quakeInfos[indexPath.row].timeString

        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toWebViewController = segue.destination as? webViewController {
            if let index = tableView.indexPathForSelectedRow {
                toWebViewController.urlOfRow = quakeInfos[index.row].url
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataServices.share.selectedQuake = quakeInfos[indexPath.row]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
