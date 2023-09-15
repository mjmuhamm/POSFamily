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
    
    var parentInformation : ParentInformation?
    
    var newAccountOrEdit = ""
    var newStudentOrEdit = ""
    var studentNumber = 0
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("newStudentOrEdit \(newStudentOrEdit)")

        print("students \(students)")
        
        if student != nil {
            self.firstName.text = "\(student!.firstName)"
            self.lastName.text = "\(student!.lastName)"
            self.studentIdentificationNumber.text = "\(student!.studentIdentificationNumber)"
            self.last4OfSSN.text = "\(student!.last4OfSSN)"
        }
        if newAccountOrEdit == "edit" && newStudentOrEdit == "edit" {
            loadInfo()
        }
        
    }
    
    private func loadInfo() {
        print("student number \(studentNumber)")
        db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(Auth.auth().currentUser!.uid).collection("Personal").document("Student \(studentNumber + 1)").getDocument { document, error in
            if error == nil {
                if document != nil {
                    let data = document!.data()
                    
                    if let firstName = data!["firstName"] as? String, let lastName = data!["lastName"] as? String, let studentIdentificationNumber = data!["studentIdentificationNumber"] as? String, let last4OfSSN = data!["last4OfSSN"] as? String {
                        
                        self.firstName.text = firstName
                        self.lastName.text = lastName
                        self.studentIdentificationNumber.text = studentIdentificationNumber
                        self.last4OfSSN.text = last4OfSSN
                    }
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        if firstName.text == "" {
            self.showToast(message: "Please enter a first name.", font: .systemFont(ofSize: 12))
        } else if lastName.text == "" {
            self.showToast(message: "Please enter a last name.", font: .systemFont(ofSize: 12))
        } else if studentIdentificationNumber.text == "" {
            self.showToast(message: "Please enter a student Identification Number", font: .systemFont(ofSize: 12))
        } else if last4OfSSN.text == "" || last4OfSSN.text!.count != 4 || Int(last4OfSSN.text!) == nil {
            self.showToast(message: "Please enter the last 4 digits of \(firstName.text!)'s Social Security Number", font: .systemFont(ofSize: 12))
        } else if (self.students.firstIndex(where: { $0.studentIdentificationNumber == self.studentIdentificationNumber.text! }) != nil) == true {
            self.showToast(message: "You have a student with this student Identification Number already. Please check your information and try again.", font: .systemFont(ofSize: 12))
        } else if (self.students.firstIndex(where: { "\($0.firstName) \($0.lastName)" == "\(self.firstName.text!) \(self.lastName.text!)" }) != nil) == true {
            self.showToast(message: "You have a student with this name already. Please check your information and try again.", font: .systemFont(ofSize: 12))
        } else {
            
            let x = Student(studentNumber: "Student \(studentNumber)", firstName: firstName.text!, lastName: lastName.text!, studentIdentificationNumber: studentIdentificationNumber.text!, last4OfSSN: last4OfSSN.text!)
            
            let data : [String: Any] = ["firstName" : self.firstName.text!, "lastName" : self.lastName.text!, "studentIdentificationNumber" : self.studentIdentificationNumber.text!, "last4OfSSN" : last4OfSSN.text!]
            
            if newAccountOrEdit == "edit" {
                
                    if newStudentOrEdit == "edit" {
    
                        self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(Auth.auth().currentUser!.uid).collection("Personal").document("Student \(self.studentNumber)").updateData(data)
                        
                    } else {
                        
                        self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(Auth.auth().currentUser!.uid).collection("Personal").document("Student \(self.studentNumber)").setData(data)
                        
                    }
               
                self.showToastCompletion(message: "Student Updated.", font: .systemFont(ofSize: 12))
                
            } else {
            
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentPersonal") as? ParentPersonalViewController  {
                    
                    if newAccountOrEdit == "edit" {
                        let y = Auth.auth().currentUser!.uid
                        let data: [String: Any] = ["firstName" : firstName.text!, "lastName" : lastName.text!, "studentIdentificationNumber" : studentIdentificationNumber.text!, "last4OfSSN" : last4OfSSN.text!]
                        
                        
                        vc.newOrEdit = "edit"
                        if self.newStudentOrEdit == "edit" {
                            self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(y).collection("Personal").document("Student \(studentNumber)").updateData(data)
                        } else {
                            self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(y).collection("Personal").document("Student \(studentNumber)").setData(data)
                        }
                    } else {
                        vc.newOrEdit = "new"
                        vc.parentInformation = self.parentInformation
                        
                        if self.newStudentOrEdit == "edit" {
                            print("student Number \(self.studentNumber)")
                            self.students.remove(at: self.studentNumber)
                            self.students.insert(x, at: self.studentNumber)
                            vc.students = self.students
                        } else {
                            self.students.append(x)
                            vc.students = self.students
                        }
                    }
                    
                }
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
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentPersonal") as? ParentPersonalViewController  {
                self.present(vc, animated: true, completion: nil)
            }
            toastLabel.removeFromSuperview()
        })
    }
    
    

}
