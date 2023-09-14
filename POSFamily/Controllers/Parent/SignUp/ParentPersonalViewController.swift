//
//  ParentPersonalViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/13/23.
//

import UIKit
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
    
    var newOrEdit = "new"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if newOrEdit == "edit" {
            loadInfo()
        } else {
          newOrEditFunction()
        }
        
    }
    
    func loadInfo() {
        
    }
    
    func newOrEditFunction() {
        if students.count == 1 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
        } else if students.count == 2 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2Stack.isHidden = false
        } else if students.count == 3 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
        } else if students.count == 4 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(named: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            
        } else if students.count == 5 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(named: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(named: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
        } else if students.count == 6 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(named: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(named: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(named: "pencil"), for: .normal)
            student6.text = "\(students[5].firstName) \(students[5].lastName)"
            student6Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            student6Stack.isHidden = false
        } else if students.count == 7 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(named: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(named: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(named: "pencil"), for: .normal)
            student6.text = "\(students[5].firstName) \(students[5].lastName)"
            student6Button.setImage(UIImage(named: "pencil"), for: .normal)
            student7.text = "\(students[6].firstName) \(students[6].lastName)"
            student7Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2Stack.isHidden = false
            student3Stack.isHidden = false
            student4Stack.isHidden = false
            student5Stack.isHidden = false
            student6Stack.isHidden = false
            student7Stack.isHidden = false
        } else if students.count == 8 {
            student1.text = "\(students[0].firstName) \(students[0].lastName)"
            student1Button.setImage(UIImage(named: "pencil"), for: .normal)
            student2.text = "\(students[1].firstName) \(students[1].lastName)"
            student2Button.setImage(UIImage(named: "pencil"), for: .normal)
            student3.text = "\(students[2].firstName) \(students[2].lastName)"
            student3Button.setImage(UIImage(named: "pencil"), for: .normal)
            student4.text = "\(students[3].firstName) \(students[3].lastName)"
            student4Button.setImage(UIImage(named: "pencil"), for: .normal)
            student5.text = "\(students[4].firstName) \(students[4].lastName)"
            student5Button.setImage(UIImage(named: "pencil"), for: .normal)
            student6.text = "\(students[5].firstName) \(students[5].lastName)"
            student6Button.setImage(UIImage(named: "pencil"), for: .normal)
            student7.text = "\(students[6].firstName) \(students[6].lastName)"
            student7Button.setImage(UIImage(named: "pencil"), for: .normal)
            student8.text = "\(students[7].firstName) \(students[7].lastName)"
            student8Button.setImage(UIImage(named: "pencil"), for: .normal)
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
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 0 {
                    vc.student = students[0]
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 0
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student2ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 1 {
                    vc.student = students[1]
                } else if students.count == 1 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 1
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student3ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 2 {
                    vc.student = students[2]
                } else if students.count == 2 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 2
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student4ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 3 {
                    vc.student = students[3]
                } else if students.count == 3 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 3
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student5ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 4 {
                    vc.student = students[4]
                } else if students.count == 4 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 4
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func student6ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 5 {
                    vc.student = students[5]
                } else if students.count == 5 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 5
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student7ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 6 {
                    vc.student = students[6]
                } else if students.count == 6 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 6
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func student8ButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentAdd") as? StudentAddViewController  {
            if self.newOrEdit == "new" {
                if students.count > 7 {
                    vc.student = students[7]
                } else if students.count == 7 {
                    vc.students = students
                    vc.newStudentOrEdit = "edit"
                }
            } else {
                vc.newAccountOrEdit = "edit"
            }
            vc.studentNumber = 7
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        
        
    }
    
    
}
