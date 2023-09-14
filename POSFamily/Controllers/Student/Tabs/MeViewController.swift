//
//  MeViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class MeViewController: UIViewController {

    let db = Firestore.firestore()
    
    @IBOutlet var paymentView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var remainingBalance: UILabel!
    @IBOutlet var totalSpent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        paymentView.layer.borderColor = UIColor.white.cgColor
        paymentView.layer.borderWidth = 1
        paymentView.layer.cornerRadius = 8
        
        loadInfo()
        
    }
    
    private func loadInfo() {
        let x = Auth.auth().currentUser!.uid
        
        for i in 0..<2 {
            var y = "Personal"
            if i == 1 {
                y = "Banking"
            }
            db.collection("Gary Community School Corporation").document("Students").collection("Students").document(x).collection(y).addSnapshotListener { documents, error in
                if error == nil {
                    for doc in documents!.documents {
                        let data = doc.data()
                        
                        if i == 0 {
                            if let fullName = data["fullName"] as? String {
                                self.nameLabel.text = "Hi, \(fullName)"
                            }
                        } else {
                            if let remainingBalance = data["remainingBalance"] as? String, let totalSpent = data["totalSpent"] as? String {
                                self.remainingBalance.text = "$\(remainingBalance)"
                                self.totalSpent.text = "$\(totalSpent)"
                            }
                        }
                    }
                }
            }
        }
        
    
    }
    
    @IBAction func notificationsButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Notifications") as! NotificationsViewController
            self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        print("happening")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentSettings") as! StudentSettingsViewController
            self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func requestMoneyFromParentsButton(_ sender: Any) {
        
    }
    
    
}
