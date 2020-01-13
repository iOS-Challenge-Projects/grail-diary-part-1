//
//  ViewController.swift
//  GrailDiary
//
//  Created by FGT MAC on 1/10/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var poiArray: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPoiVC = segue.destination as? AddPOIViewController {
                addPoiVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue"{
            if let detailVC = segue.destination as? POIDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                detailVC.poi = poiArray[indexPath.row]
            }
        }
    }
    
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        
//        cell.textLabel?.text = poiArray[indexPath.row].location
        
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        
        //add the new POI to the array
        poiArray.append(poi)
        
        //Dismiss modal
        dismiss(animated: true, completion: nil)
        
        //Reload table to show new POI
        tableView.reloadData()
    }
}
