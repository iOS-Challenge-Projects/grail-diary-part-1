//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by FGT MAC on 1/13/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI?  {
        didSet{
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func updateViews(){
        if let safePOI = poi {
            self.locationLabel.text = safePOI.location
            self.countryLabel.text = safePOI.country
            self.cluesLabel.text = "\(safePOI.clues.count) Clues"
        }
    }
}
