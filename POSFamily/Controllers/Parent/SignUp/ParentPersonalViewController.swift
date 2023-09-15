//
//  ParentPersonalViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/13/23.
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

class ParentPersonalViewController: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet var fullName: UITextField!
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!

    @IBOutlet var student1: UILabel!
    @IBOutlet var student1Button: UIButton!
    
    @IBOutlet var student2Stack: UIStackView!
    @IBOutlet var student2: UILabel!
    @IBOutlet var student2Button: UIButton!
    
    @IBOutlet var student3Stack: UIStackView!
    @IBOutlet var student3: UILabel!
    @IBOutlet var student3Button: UIButton!
    
    @IBOutlet var student4Stack: UIStackView!
    @IBOutlet var student4: UILabel!
    @IBOutlet var student4Button: UIButton!
    
    @IBOutlet var student5Stack: UIStackView!
    @IBOutlet var student5: UILabel!
    @IBOutlet var student5Button: UIButton!
    
    @IBOutlet var student6Stack: UIStackView!
    @IBOutlet var student6: UILabel!
    @IBOutlet var student6Button: UIButton!
    
    @IBOutlet var student7Stack: UIStackView!
    @IBOutlet var student7: UILabel!
    @IBOutlet var student7Button: UIButton!
    
    @IBOutlet var student8Stack: UIStackView!
    @IBOutlet var student8: UILabel!
    @IBOutlet var student8Button: UIButton!
    
    @IBOutlet var saveButton: MDCButton!
    
    var students : [Student] = []
    
    var parentInformation: ParentInformation?
    
    var newOrEdit = "new"
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("students \(students)")
        

        
        if newOrEdit == "edit" {
            loadInfo()
            
        } else {
          newOrEditFunction()
        }
        
    }
    
    func loadInfo() {
        self.fullName.isEnabled = false
        self.email.isEnabled = false
        db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(Auth.auth().currentUser!.uid).collection("Personal").getDocuments { documents, error in
            if error == nil {
                if documents != nil {
                    for doc in documents!.documents {
                        let data = doc.data()
                        
                        if doc.documentID == "Personal" {
                            
                            if let fullName = data["fullName"] as? String, let numberOfStudents = data["numberOfStudents"] as? Int {
                                self.fullName.text = fullName
                                self.password.text = "*********"
                                self.confirmPassword.text = "*********"
                                
                            }} else {
                                print("document Id \(doc.documentID)")
                                if let firstName = data["firstName"] as? String, let lastName = data["lastName"] as? String, let studentIdentificationNumber = data["studentIdentificationNumber"] as? String, let last4OfSSN = data["last4OfSSN"] as? String {
                                    
                                    let x = Student(studentNumber: doc.documentID, firstName: firstName, lastName: lastName, studentIdentificationNumber: studentIdentificationNumber, last4OfSSN: last4OfSSN)
                                    self.students.append(x)
                                    
                                    if doc.documentID == "Student 1" {
                                        self.student1.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                    } else if doc.documentID == "Student 2" {
                                        self.student2.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                    } else if doc.documentID == "Student 3" {
                                        self.student3.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                        self.student4Stack.isHidden = false
                                    } else if doc.documentID == "Student 4" {
                                        self.student4.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                        self.student4Stack.isHidden = false
                                        self.student5Stack.isHidden = false
                                    } else if doc.documentID == "Student 5" {
                                        self.student5.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                        self.student4Stack.isHidden = false
                                        self.student5Stack.isHidden = false
                                        self.student6Stack.isHidden = false
                                    } else if doc.documentID == "Student 6" {
                                        self.student6.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                        self.student4Stack.isHidden = false
                                        self.student5Stack.isHidden = false
                                        self.student6Stack.isHidden = false
                                        self.student7Stack.isHidden = false
                                    } else if doc.documentID == "Student 7" {
                                        self.student7.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                        self.student4Stack.isHidden = false
                                        self.student5Stack.isHidden = false
                                        self.student6Stack.isHidden = false
                                        self.student7Stack.isHidden = false
                                        self.student8Stack.isHidden = false
                                    } else if doc.documentID == "Student 8" {
                                        self.student8.text = "\(firstName) \(lastName)"
                                        self.student2Stack.isHidden = false
                                        self.student3Stack.isHidden = false
                                        self.student4Stack.isHidden = false
                                        self.student5Stack.isHidden = false
                                        self.student6Stack.isHidden = false
                                        self.student7Stack.isHidden = false
                                        self.student8Stack.isHidden = false
                                    }
                                    
                                }
                                
                            }
                    }
                }
            }
        }
        
        
        
    }
    
    func newOrEditFunction() {
        if parentInformation != nil {
            self.fullName.text = parentInformation!.fullName
            self.email.text = parentInformation!.email
            self.password.text = parentInformation!.password
            self.confirmPassword.text = parentInformation!.confirmPassword
        }
        
        if students.count == 1 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
        } else if students.count == 2 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
        } else if students.count == 3 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
        } else if students.count == 4 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            
        } else if students.count == 5 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            student6Stack.isHidden = false
        } else if students.count == 6 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student6.text = "\(students[5].firstName) \(students[5].lastName)"
            student6Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            student6Stack.isHidden = false
            student7Stack.isHidden = false
        } else if students.count == 7 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student6.text = "\(students[5].firstName) \(students[5].lastName)"
            student6Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student7.text = "\(students[6].firstName) \(students[6].lastName)"
            student7Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            student6Stack.isHidden = false
            student7Stack.isHidden = false
            student8Stack.isHidden = false
        } else if students.count == 8 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student6.text = "\(students[5].firstName) \(students[5].lastName)"
            student6Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student7.text = "\(students[6].firstName) \(students[6].lastName)"
            student7Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student8.text = "\(students[7].firstName) \(students[7].lastName)"
            student8Button.setImage(UIImage(systemName: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            student6Stack.isHidden = false
            student7Stack.isHidden = false
            student8Stack.isHidden = false
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func student1ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 0 {
                    vc.student = students[0]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                if students.count > 0 {
                    vc.newStudentOrEdit = "edit"
                }
                vc.students = students
            }
            vc.studentNumber = 0
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student2ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 1 {
                    vc.student = students[1]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 1 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 1
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student3ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 2 {
                    vc.student = students[2]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 2 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 2
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student4ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 3 {
                    vc.student = students[3]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 3 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 3
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student5ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 4 {
                    vc.student = students[4]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 4 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 4
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func student6ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 5 {
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 5 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 5
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student7ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 6 {
                    vc.student = students[6]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 6 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 6
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student8ButtonPressed(_ sender: Any) {
        self.parentInformation = ParentInformation(fullName: self.fullName.text!, email: self.email.text!, password: self.password.text!, confirmPassword: self.confirmPassword.text!)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                vc.students = students
                vc.parentInformation = self.parentInformation
                if students.count > 7 {
                    vc.student = students[7]
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
                vc.students = students
                if students.count > 7 {
                    vc.newStudentOrEdit = "edit"
                }
            }
            vc.studentNumber = 7
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        if newOrEdit == "new" {
        if fullName.text == "" {
            self.showToast(message: "Please enter your full name.", font: .systemFont(ofSize: 12))
        } else if email.text == "" || !isValidEmail(self.email.text!) {
            self.showToast(message: "Please enter your email.", font: .systemFont(ofSize: 12))
        } else if password.text == "" || !isPasswordValid(password: self.password.text!) {
            self.showToast(message: "Please enter a password that includes 1 upper case character, 1 special character, 1 number, 1 lowercase letter, and is at least 8 characters long.", font: .systemFont(ofSize: 12))
        } else if students.count == 0 {
            self.showToast(message: "Please enter at least 1 password.", font: .systemFont(ofSize: 12))
        } else {
            
                Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { result, error in
                    if error == nil {
                        if result != nil {
                            let x = result!.user.uid
                            
                            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                            changeRequest?.displayName = "Parent"
                            changeRequest?.commitChanges { error in
                                // ...
                            }
                            
                            let data : [String : Any] = ["fullName" : self.fullName.text!, "numberOfStudents" : self.students.count]
                            
                           
                            
                            for i in 0..<self.students.count {
                                let data1 : [String: Any] = ["firstName" : self.students[i].firstName, "lastName" : self.students[i].lastName, "studentIdentificationNumber" : self.students[i].studentIdentificationNumber, "last4OfSSN" : self.students[i].last4OfSSN]
                                
                                if i == 0 {
                                    self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(x).collection("Personal").document("Personal").setData(data)
                                }
                            
                                    self.db.collection("Gary Community School Corporation").document("Parents").collection("Parents").document(x).collection("Personal").document("Student \(i + 1)").setData(data1)
                                
                            }
                        }
                        
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentTab") as? UITabBarController  {
                            self.present(vc, animated: true, completion: nil)
                        }
                        
                    }
                }
            }
        } else {
            if self.password.text != "" && !(self.password.text?.contains("*"))! {
                if !isPasswordValid(password: self.password.text!) {
                    self.showToast(message: "Please enter a valid password to change your password.", font: .systemFont(ofSize: 12))
                } else {
                    let alert = UIAlertController(title: "Are you sure you want to change your password?", message: nil, preferredStyle: .actionSheet)
                    
                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (handler) in
                        if Auth.auth().currentUser != nil {
                            let uid = Auth.auth().currentUser!.uid
                            Auth.auth().currentUser!.delete { error in
                                if error == nil {
                                    Auth.auth().currentUser!.updatePassword(to: self.password.text!)
                                    self.showToastCompletion(message: "Profile Updated.", font: .systemFont(ofSize: 12))
                                    
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
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FamilySettings") as? AccountSettingsViewController  {
                self.present(vc, animated: true, completion: nil)
            }
            toastLabel.removeFromSuperview()
        })
    }
    
    
}
