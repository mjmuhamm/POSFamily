//
//  PersonalViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/13/23.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class PersonalViewController: UIViewController {

    @IBOutlet var fullName: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
    @IBOutlet var burgerButton: MDCButton!
    @IBOutlet var creativeButton: MDCButton!
    @IBOutlet var lowCalButton: MDCButton!
    @IBOutlet var lowCarbButton: MDCButton!
    @IBOutlet var pastaButton: MDCButton!
    @IBOutlet var healthyButton: MDCButton!
    @IBOutlet var veganButton: MDCButton!
    @IBOutlet var seafoodButton: MDCButton!
    @IBOutlet var workoutButton: MDCButton!
    
    
    @IBOutlet var saveButton: MDCButton!
    
    private var burger = 0
    private var creative = 0
    private var lowCal = 0
    private var lowCarb = 0
    private var pasta = 0
    private var healthy = 0
    private var vegan = 0
    private var seafood = 0
    private var workout = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func burgerButtonPressed(_ sender: Any) {
        if burgerButton.backgroundColor == UIColor.clear {
            burgerButton.backgroundColor = UIColor.lightGray
            burger = 1
        } else {
            burgerButton.backgroundColor = UIColor.clear
            burger = 0
        }
    }
    
    
    @IBAction func creativeButtonPressed(_ sender: Any) {
        if creativeButton.backgroundColor == UIColor.clear {
            creativeButton.backgroundColor = UIColor.lightGray
            creative = 1
        } else {
            creativeButton.backgroundColor = UIColor.clear
            creative = 0
        }
        
    }
    
    @IBAction func lowCalButtonPressed(_ sender: Any) {
        if lowCalButton.backgroundColor == UIColor.clear {
            lowCalButton.backgroundColor = UIColor.lightGray
            lowCal = 1
        } else {
            lowCalButton.backgroundColor = UIColor.clear
            lowCal = 0
        }
    }
    
    @IBAction func lowCarbButtonPressed(_ sender: Any) {
        if lowCarbButton.backgroundColor == UIColor.clear {
            lowCarbButton.backgroundColor = UIColor.lightGray
            lowCarb = 1
        } else {
            lowCarbButton.backgroundColor = UIColor.clear
            lowCarb = 0
        }
        
    }
    
    @IBAction func pastaButtonPressed(_ sender: Any) {
        if pastaButton.backgroundColor == UIColor.clear {
            pastaButton.backgroundColor = UIColor.lightGray
            pasta = 1
        } else {
            pastaButton.backgroundColor = UIColor.clear
            pasta = 0
        }
    }
    
    @IBAction func healthyButtonPressed(_ sender: Any) {
        if healthyButton.backgroundColor == UIColor.clear {
            healthyButton.backgroundColor = UIColor.lightGray
            healthy = 1
        } else {
            healthyButton.backgroundColor == UIColor.clear
            healthy = 0
        }
    }
    
    @IBAction func veganButtonPressed(_ sender: Any) {
        if veganButton.backgroundColor == UIColor.clear {
            veganButton.backgroundColor == UIColor.lightGray
            vegan = 1
        } else {
            veganButton.backgroundColor = UIColor.clear
            vegan = 0
        }
    }
    
    @IBAction func seafoodButtonPressed(_ sender: Any) {
        if seafoodButton.backgroundColor == UIColor.clear {
            seafoodButton.backgroundColor = UIColor.lightGray
            seafood = 1
        } else {
            seafoodButton.backgroundColor = UIColor.clear
            seafood = 0
        }
    }
    
    
    @IBAction func workoutButtonPressed(_ sender: Any) {
        if workoutButton.backgroundColor == UIColor.clear {
            workoutButton.backgroundColor = UIColor.lightGray
            workout = 1
        } else {
            workoutButton.backgroundColor = UIColor.clear
            workout = 0
        }
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
    }
    
}
