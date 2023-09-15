//
//  AccountSettingsViewController.swift
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

class AccountSettingsViewController: UIViewController {
    
    private let db = Firestore.firestore()
    
    
    @IBOutlet var logout: MDCButton!
    @IBOutlet var deleteAccount: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logout.applyOutlinedTheme(withScheme: globalContainerScheme())
        deleteAccount.applyOutlinedTheme(withScheme: globalContainerScheme())
        logout.layer.cornerRadius = 7
        deleteAccount.layer.cornerRadius = 7
        
        
        logout.setTitleColor(UIColor.white, for: .normal)
        logout.backgroundColor = UIColor.systemFill
        
        deleteAccount.setTitleColor(UIColor.white, for: .normal)
        deleteAccount.backgroundColor = UIColor.systemRed

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentPersonal") as? ParentPersonalViewController  {
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
                        self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(uid).delete()
                        
                        
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
