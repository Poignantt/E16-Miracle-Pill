//
//  ViewController.swift
//  E16 Miracle Pill
//
//  Created by Koorosh Khadembashi on 1/12/16.
//  Copyright © 2016 Atiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // weak references mean that the link to the reference will not be held once the view is no longer visible.
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var streetAddressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var statePickerBTN: UIButton!
    @IBOutlet weak var stateLabel: UILabel!
    
    var currentRow: Int?
    var states = ["Australian Capital Terrirory","New South Wales","Northern Territory","Queensland","South Australia","Tasmania","Victoria","Western Australia"]


    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentRow = row
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stateButtonPress(_ sender: Any) {
        
        if statePicker.isHidden == true {
        statePicker.isHidden = false
        statePickerBTN.setTitle("Select State", for: UIControlState.normal)
        } else {
        statePicker.isHidden = true
        stateLabel.text = states[currentRow!]
        statePickerBTN.setTitle("Change State", for: UIControlState.normal)
        }
    }
    

    @IBAction func buyButtonPress(_ sender: Any) {
    }

    
    
}

