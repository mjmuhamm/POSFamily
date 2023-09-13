//
//  StudentLoginViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/11/23.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class StudentLoginViewController: UIViewController {
    
    @IBOutlet var email: MDCOutlinedTextField!
    @IBOutlet var password: MDCOutlinedTextField!
    
    @IBOutlet var login: MDCButton!
    
    @IBOutlet var newStudentSignUpButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.setOutlineColor(UIColor.systemGray, for: .normal)
        email.setOutlineColor(UIColor.white, for: .editing)
        email.setTextColor(UIColor.white, for: .normal)
        email.setTextColor(UIColor.white, for: .editing)
        
        email.setNormalLabelColor(UIColor.white, for: .normal)
        email.setFloatingLabelColor(UIColor.white, for: .editing)
        
        password.setOutlineColor(UIColor.systemGray, for: .normal)
        password.setOutlineColor(UIColor.white, for: .editing)
        password.setTextColor(UIColor.white, for: .normal)
        password.setTextColor(UIColor.white, for: .editing)
        
        password.setNormalLabelColor(UIColor.white, for: .normal)
        password.setFloatingLabelColor(UIColor.white, for: .editing)
        
        email.layer.cornerRadius = 2
        password.layer.cornerRadius = 2
        
        
        newStudentSignUpButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        
        
        
        email.label.text = "Email"
        email.placeholder = "Email"
        
        login.applyOutlinedTheme(withScheme: globalContainerScheme())
        login.layer.cornerRadius = 2
        
        password.label.text = "Password"
        password.placeholder = "Password"
        password.sizeToFit()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func newStudentSignUpButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentPersonal") as? PersonalViewController  {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
}
