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
    //@IBOutlet weak var fullNameL: UILabel!
    
    @IBOutlet weak var streetAddressTF: UITextField!
    //@IBOutlet weak var streetAddressL: UILabel!
    
    @IBOutlet weak var cityTF: UITextField!
    //@IBOutlet weak var cityL: UILabel!
    
    //@IBOutlet weak var stateL: UILabel!
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var successImage: UIImageView!
    
    @IBOutlet weak var statePickerBTN: UIButton!
    @IBOutlet weak var stateLabel: UILabel!
    
    

    @IBOutlet weak var countryL: UILabel!
    @IBOutlet weak var countryTF: UITextField!
    
    
    @IBOutlet weak var zipcodeL: UILabel!
    @IBOutlet weak var zipeCodeTF: UITextField!
    
    //@IBOutlet weak var buyNowBTN: UIButton!
    //@IBOutlet weak var pillImage: UIImageView!
    //@IBOutlet weak var miracleLabel: UILabel!
    //@IBOutlet weak var costLabel: UILabel!
    //@IBOutlet weak var divider: UIView!
    
    
    var currentRow: Int?
    var states = ["Australian Capital Terrirory","New South Wales","Northern Territory","Queensland","South Australia","Tasmania","Victoria","Western Australia"]
    var stateAcro = ["ACT","NSW","NT","QLD","SA","TAS","TAS","WA"]


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
            countryL.isHidden = true
            countryTF.isHidden = true
            
            zipcodeL.isHidden = true
            zipeCodeTF.isHidden = true
        } else {
        statePicker.isHidden = true
            if let row = currentRow {
              stateLabel.text = states[row]
            } else {
              stateLabel.text = states[0]
            }
        statePickerBTN.setTitle("Change State", for: UIControlState.normal)
            countryL.isHidden = false
            countryTF.isHidden = false
            
            zipcodeL.isHidden = false
            zipeCodeTF.isHidden = false
        }
    }
    

    @IBAction func buyButtonPress(_ sender: Any) {
        if fullNameTF.text != "" && streetAddressTF.text != "" && cityTF.text != "" && stateLabel.text != "" && countryTF.text != "" && zipeCodeTF.text != "" && statePicker.isHidden == true{
            for view in self.view.subviews {
                view.isHidden = true
            }
            /*
            fullNameTF.isHidden = true
            fullNameL.isHidden = true
            streetAddressTF.isHidden = true
            streetAddressL.isHidden = true
            
            cityTF.isHidden = true
            cityL.isHidden = true
            
            stateL.isHidden = true
            statePicker.isHidden = true
            
            
            
            statePickerBTN.isHidden = true
            stateLabel.isHidden = true
            
            countryL.isHidden = true
            countryTF.isHidden = true
            
            zipCodeL.isHidden = true
            zipeCodeTF.isHidden = true
            divider.isHidden = true
            
            buyNowBTN.isHidden = true
            pillImage.isHidden = true
            miracleLabel.isHidden = true
            costLabel.isHidden = true
            */
            
            successImage.isHidden = false
            
            var stateAcronym = ""
            if  currentRow != nil  {stateAcronym = stateAcro[currentRow!]} else {stateAcronym = stateAcro[0]}
            
            print("\n\n\nMiracle Drug for\n\(fullNameTF.text!)\n\(streetAddressTF.text!), \(zipeCodeTF.text!) \(cityTF.text!)\n\(stateAcronym), \(countryTF.text!)")
        }
    }
    
    
    
}

