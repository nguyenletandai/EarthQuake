//
//  TableViewCell.swift
//  EarthQuake
//
//  Created by daicudu on 12/21/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cricleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cricleLabel.backgroundColor = .red


    }
    override func prepareForReuse() {
        cricleLabel.text = ""
        distanceLabel.text = ""
        locationLabel.text = ""
        dateLabel.text = ""
        timeLabel.text = ""
        cricleLabel.backgroundColor = UIColor.red
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

@IBDesignable
class CustomLabel: UILabel {
    

private var _cornerRadius: CGFloat = 0.0
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return _cornerRadius
        }
        set (newvaluew) {
            _cornerRadius = newvaluew
            setupCornerRadius()
        }
        
    }
    
    func setupCornerRadius() {
        if _cornerRadius == -1 {
            layer.cornerRadius = frame.height / 2
        }else {
            layer.cornerRadius = _cornerRadius
        }
    }
    
}
