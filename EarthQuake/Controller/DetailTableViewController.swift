//
//  DetailTableViewController.swift
//  EarthQuake
//
//  Created by daicudu on 12/28/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var dataDetail: QuakeInfo?

    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var evenTime: UILabel!
    @IBOutlet weak var depth: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var felt: UILabel!
    @IBOutlet weak var cdi: UILabel!
    @IBOutlet weak var mmi: UILabel!
    @IBOutlet weak var alert: UILabel!
    @IBOutlet weak var place: UILabel!
    
    enum CellType: Int {
        case mag
        case time
        case depth
        case latitude
        case longitude
        case felt
        case cdi
        case mmi
        case alert
        case place
        
        func needToShow(dataDetail: QuakeInfo?) -> Bool {
            switch self {
            case .mag:
                return dataDetail?.mag != nil
            case .place:
                return !checkStringIsNillOrEmpty(string: dataDetail?.distanceString) || !checkStringIsNillOrEmpty(string: dataDetail?.locationName)
            case .time:
                return !checkStringIsNillOrEmpty(string: dataDetail?.timeString)
            case .depth:
                return !checkStringIsNillOrEmpty(string: dataDetail?.depth)
            case .latitude:
                return !checkStringIsNillOrEmpty(string: dataDetail?.latitude)
            case .longitude:
                return !checkStringIsNillOrEmpty(string: dataDetail?.longitude)
            case .felt:
                return dataDetail?.felt != nil
                
                
            case .cdi:
                return dataDetail?.cdi != nil
            case .mmi:
                return dataDetail?.mmi != nil
            case .alert:
                return !checkStringIsNillOrEmpty(string: dataDetail?.alert)
            }
        }
        
        private func checkStringIsNillOrEmpty(string: String?) -> Bool {
            guard let aString = string else {return true}
            if aString.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { // cat di nhung ky tu trong WhitespacesAndNewLines roi kiem tra trong
                return true
            }
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DataServices.share.selectedQuake?.loadDataDetail { [unowned self] quakeInfo in
            self.dataDetail = quakeInfo
            self.magLabel.text = "Mag: \(self.dataDetail?.mag)"
            self.place.text = "Place \(self.dataDetail?.distanceString) \(self.dataDetail?.locationName)"
            
            if let eventime = self.dataDetail?.eventTime {
                self.evenTime.text = " Even Time: \(eventime)"
            }
            if let depth = self.dataDetail?.depth {
                self.depth.text = "depth: \(depth)"
            }
            if let latitude = self.dataDetail?.latitude {
                self.latitude.text = "latitudu: \(latitude)"
            }
            if let longtidu = self.dataDetail?.longitude {
                self.longitude.text = "Longtidu: \(longtidu)"
            }
            if let felf = self.dataDetail?.felt {
                self.felt.text = "Felf: \(felf)"
            }
            if let cdi = self.dataDetail?.cdi {
                self.cdi.text = "cdi: \(cdi)"
            }
            if let mmi = self.dataDetail?.mmi {
                self.mmi.text = "mmi: \(mmi)"
            }
            self.alert.text = " Alert: \(self.dataDetail?.alert ?? "")"
            self.tableView.reloadData()
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cellType = CellType(rawValue: indexPath.row) {
            return cellType.needToShow(dataDetail: dataDetail) ? UITableView.automaticDimension : 0
        }else{
            return 0
        }
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
