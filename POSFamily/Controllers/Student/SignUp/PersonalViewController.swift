//
//  PersonalViewController.swift
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

class PersonalViewController: UIViewController {

    private var db = Firestore.firestore()
    
    
    @IBOutlet var fullName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var studentIdentificationNumber: UITextField!
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
    
    var newOrEdit = "new"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        saveButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        
        if newOrEdit == "edit" {
            loadInfo()
        }
        
    }
    
    private func loadInfo() {
        let x = Auth.auth().currentUser!.uid
        db.collection("Gary Community School Corporation").document("Students").collection("Students").document(x).collection("Personal").getDocuments { documents, error in
            if error == nil {
                for doc in documents!.documents {
                    let data = doc.data()
                    
                    if let fullName = data["fullName"] as? String, let studentIdentificationNumber = data["studentIdentificationNumber"] as? String, let burger = data["burger"] as? Int, let creative = data["creative"] as? Int, let healthy = data["healthy"] as? Int, let lowCal = data["lowCal"] as? Int, let lowCarb = data["lowCarb"] as? Int, let pasta = data["pasta"] as? Int, let seafood = data["seafood"] as? Int, let vegan = data["vegan"] as? Int, let workout = data["workout"] as? Int {
                        
                        self.fullName.text = fullName
                        self.studentIdentificationNumber.text = studentIdentificationNumber
                        
                        self.email.text = Auth.auth().currentUser!.email!
                        
                        self.password.text = "*********"
                        self.confirmPassword.text = "*********"
                        
                        self.fullName.isEnabled = false
                        self.studentIdentificationNumber.isEnabled = false
                        self.email.isEnabled = false
                        self.password.isEnabled = false
                        self.confirmPassword.isEnabled = false
                        
                        self.burger = burger
                        if burger == 1 {
                            self.burgerButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.burgerButton.backgroundColor = UIColor.clear
                        }
                        
                        self.creative = creative
                        if creative == 1 {
                            self.creativeButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.creativeButton.backgroundColor = UIColor.clear
                        }
                        
                        self.healthy = healthy
                        if healthy == 1 {
                            self.healthyButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.healthyButton.backgroundColor = UIColor.clear
                        }
                        
                        self.lowCal = lowCal
                        if lowCal == 1 {
                            self.lowCalButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.lowCalButton.backgroundColor = UIColor.clear
                        }
                        
                        self.lowCarb = lowCarb
                        if lowCarb == 1 {
                            self.lowCarbButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.lowCarbButton.backgroundColor = UIColor.clear
                        }
                        
                        self.pasta = pasta
                        if pasta == 1 {
                            self.pastaButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.pastaButton.backgroundColor = UIColor.clear
                        }
                        
                        self.seafood = seafood
                        if seafood == 1 {
                            self.seafoodButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.seafoodButton.backgroundColor = UIColor.clear
                        }
                        
                        self.vegan = vegan
                        if vegan == 1 {
                            self.veganButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.veganButton.backgroundColor = UIColor.clear
                        }
                        
                        self.workout = workout
                        if workout == 1 {
                            self.workoutButton.backgroundColor = UIColor.lightGray
                        } else {
                            self.workoutButton.backgroundColor = UIColor.clear
                        }
                        
                        
                        
                        
                    }
                }
            }
        }
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
            healthyButton.backgroundColor = UIColor.clear
            healthy = 0
        }
    }
    
    @IBAction func veganButtonPressed(_ sender: Any) {
        if veganButton.backgroundColor == UIColor.clear {
            veganButton.backgroundColor = UIColor.lightGray
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
        
        if self.newOrEdit == "new" {
        if fullName.text == "" {
            self.showToast(message: "Please enter your full name.", font: .systemFont(ofSize: 12))
        } else if email.text == "" || !isValidEmail(email.text!) {
            self.showToast(message: "Please enter a valid email.", font: .systemFont(ofSize: 12))
        } else if studentIdentificationNumber.text == "" {
            self.showToast(message: "Please enter your student identification number.", font: .systemFont(ofSize: 12))
        } else if password.text == "" || !isPasswordValid(password: password.text!) {
            self.showToast(message: "Please enter a password that includes 1 upper case character, 1 special character, 1 number, 1 lowercase letter, and is at least 8 characters long.", font: .systemFont(ofSize: 12))
        } else if password.text != confirmPassword.text {
            self.showToast(message: "Please make sure your passwords match.", font: .systemFont(ofSize: 12))
        } else {
            
            
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { result, error in
                if error == nil {
                    if result != nil {
                        let x = result!.user.uid
                        
                        let data : [String: Any] = ["fullName" : self.fullName.text!, "studentIdentificationNumber" : self.studentIdentificationNumber.text!, "burger" : self.burger, "creative": self.creative, "lowCal": self.lowCal, "lowCarb": self.lowCarb, "pasta": self.pasta, "healthy" : self.healthy, "vegan" : self.vegan, "seafood": self.seafood, "workout" : self.workout]
                        
                        let data1 : [String: Any] = ["remainingBalance" : "0.00", "totalSpent" : "0.00"]
                        
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = "Student"
                        changeRequest?.commitChanges { error in
                            // ...
                        }
                        
                        self.db.collection("Gary Community School Corporation").document("Students").collection("Students").document(x).collection("Personal").document(x).setData(data)
                        self.db.collection("Gary Community School Corporation").document("Students").collection("Students").document(x).collection("Banking").document(x).setData(data1)
                        
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentTab") as? UITabBarController  {
                            self.present(vc, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
            } else {
                let x = Auth.auth().currentUser!.uid
                
                let data : [String: Any] = ["burger" : self.burger, "creative": self.creative, "lowCal": self.lowCal, "lowCarb": self.lowCarb, "pasta": self.pasta, "healthy" : self.healthy, "vegan" : self.vegan, "seafood": self.seafood, "workout" : self.workout]
                
                self.db.collection("Gary Community School Corporation").document("Students").collection("Students").document(x).collection("Personal").document(x).updateData(data)
                self.showToastCompletion(message: "Saved.", font: .systemFont(ofSize: 12))
                
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
        UIView.animate(withDuration: 2.5, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentTab") as? UITabBarController  {
                self.present(vc, animated: true, completion: nil)
            }
            toastLabel.removeFromSuperview()
        })
    }
    
    
    
  
    
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)

    
}

func isPasswordValid(password: String) -> Bool {
    let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
    print("password \(passwordTest.evaluate(with: password))")
    return passwordTest.evaluate(with: password)
}


func searchForSpecialChar(search: String) -> Bool {
    let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    if search.rangeOfCharacter(from: characterset.inverted) != nil {
        print("string contains special characters")
        return true
    }
    return false
}
