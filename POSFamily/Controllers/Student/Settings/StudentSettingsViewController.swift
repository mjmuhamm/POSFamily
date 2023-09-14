//
//  StudentSettingsViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/14/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class StudentSettingsViewController: UIViewController {

    let db = Firestore.firestore()
    
    @IBOutlet var logoutButton: MDCButton!
    @IBOutlet var deleteButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        deleteButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        logoutButton.layer.cornerRadius = 7
        deleteButton.layer.cornerRadius = 7
        
        
        logoutButton.setTitleColor(UIColor.white, for: .normal)
        logoutButton.backgroundColor = UIColor.systemFill
        
        deleteButton.setTitleColor(UIColor.white, for: .normal)
        deleteButton.backgroundColor = UIColor.systemRed
        
        
    }
    
   
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentPersonal") as? PersonalViewController  {
            vc.newOrEdit = "edit"
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        try? Auth.auth().signOut()
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "Start") as? StartViewController  {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func deleteAccountButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you sure you want to delete your account?", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (handler) in
            if Auth.auth().currentUser != nil {
                let uid = Auth.auth().currentUser!.uid
                Auth.auth().currentUser!.delete { error in
                    if error == nil {
                        self.db.collection("Gary Community School Corporation").document("Students").collection("Students").document(uid).delete()
                        
                        
                        self.showToastCompletion(message: "Your account has been deleted.", font: .systemFont(ofSize: 12))
                        
                    } else {
                        self.showToast(message: "Something went wrong. Please try again.", font: .systemFont(ofSize: 12))
                    }
                }
            } else {
                self.showToast(message: "Something went wrong. Please check your connection.", font: .systemFont(ofSize: 12))
            }
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (handler) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true, completion: nil)
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
    
    func showToastCompletion(message : String, font: UIFont) {
        
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
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "Start") as? StartViewController {
                self.present(vc, animated: true, completion: nil)
            }
            toastLabel.removeFromSuperview()
        })
    }
    
    
}

