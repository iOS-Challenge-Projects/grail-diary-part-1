//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by FGT MAC on 1/13/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI)
    
//    var delegate: AddPOIDelegate? { get }
}

class AddPOIViewController: UIViewController {
    
    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Use for the delegate to dimiss keyboard when
        //editing any of the following testFields
        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
        
    }
    

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
      dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {

        guard let location = locationTextField.text, let country = countryTextField.text else { return }
       
        var poi = POI(location: location, country: country, clues: [])
        
        if let clu1 = clue1TextField.text, clu1 != "" {
            poi.clues.append(clu1)
        }
        
        if let clue2 = clue2TextField.text, clue2 != "" {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue2TextField.text, clue3 != "" {
            poi.clues.append(clue3)
        }
        
         delegate?.poiWasAdded(poi)
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
extension AddPOIViewController: UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //If field is not empty the keyboard will be dismiss
        if let text = textField.text ,text != "" {
            //Dismiss keyboard on return tap
            textField.resignFirstResponder()
        }
        return true
    }
}
