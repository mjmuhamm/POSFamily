//
//  StudentAddViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/13/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class StudentAddViewController: UIViewController {

    private let db = Firestore.firestore()

    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    
    @IBOutlet var studentIdentificationNumber: UITextField!
    @IBOutlet var last4OfSSN: UITextField!
    
    @IBOutlet var saveButton: MDCButton!
    
    var students: [Student] = []
    var student : Student?
    
    var newAccountOrEdit = ""
    var newStudentOrEdit = ""
    var studentNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if firstName.text == "" {
            self.showToast(message: "Please enter a first name.", font: .systemFont(ofSize: 12))
        } else if lastName.text == "" {
            self.showToast(message: "Please enter a last name.", font: .systemFont(ofSize: 12))
        } else if studentIdentificationNumber.text == "" {
            self.showToast(message: "Please enter a student Identification Number", font: .systemFont(ofSize: 12))
        } else if last4OfSSN.text == "" || last4OfSSN.text!.count != 4 || Int(last4OfSSN.text!) == nil {
            self.showToast(message: "Please enter the last 4 digits of \(firstName.text!)'s Social Security Number", font: .systemFont(ofSize: 12))
        } else {
            let x = Student(firstName: firstName.text!, lastName: lastName.text!, studentIdentificationNumber: studentIdentificationNumber.text!, last4OfSSN: last4OfSSN.text!)
            
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentPersonal") as? ParentPersonalViewController  {
                   
                let y = Auth.auth().currentUser!.uid
                let data: [String: Any] = ["firstName" : firstName.text!, "lastName" : lastName.text!, "studentIdentificationNumber" : studentIdentificationNumber.text!, "last4OfSSN" : last4OfSSN.text!]
                
                if newAccountOrEdit == "edit" {
                    vc.newOrEdit = "edit"
                    if self.newStudentOrEdit == "edit" {
                        self.db.collection("Parents").document(y).collection("Personal").document("student\(self.studentNumber)").updateData(data)
                    } else {
                        self.db.collection("Parents").document(y).collection("Personal").document("student\(self.studentNumber)").setData(data)
                    }
                } else {
                    vc.newOrEdit = "new"
                    if self.newStudentOrEdit == "edit" {
                        self.students.remove(at: self.studentNumber)
                        self.students.insert(x, at: self.studentNumber)
                        vc.students = self.students
                    } else {
                        self.students.append(x)
                        vc.students = self.students
                    }
                }
                    
                    self.present(vc, animated: true, completion: nil)
            }
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
