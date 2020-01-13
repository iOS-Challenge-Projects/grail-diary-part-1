//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by FGT MAC on 1/13/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateViews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func updateViews(){
        guard let safePOI = poi else { return }
        locationLabel.text = safePOI.location
        countryLabel.text = safePOI.country
        cluesLabel.text = safePOI.clues[0]
    }

}
