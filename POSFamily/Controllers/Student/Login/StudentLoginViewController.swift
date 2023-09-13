//
//  StudentLoginViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/11/23.
//

import UIKit
import FirebaseAuth
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
        if email.text == "" {
            self.showToast(message: "Please enter your email address.", font: .systemFont(ofSize: 12))
        } else if password.text == "" {
            self.showToast(message: "Please enter your password.", font: .systemFont(ofSize: 12))
        } else {
            Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { result, error in
                if error == nil {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentTab") as? UITabBarController  {
                        self.present(vc, animated: true, completion: nil)
                    }
                } else {
                    self.showToast(message: "There was an error. Please make sure your email and password is correct and try again.", font: .systemFont(ofSize: 12))
                }
            }
            
        }
        
    }
    
    @IBAction func newStudentSignUpButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentPersonal") as? PersonalViewController  {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: 0, y: self.view.frame.size.height-180, width: (self.view.frame.width), height: 70))
        toastLabel.backgroundColor = UIColor.lightGray
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 4
        toastLabel.layer.cornerRadius = 1;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
