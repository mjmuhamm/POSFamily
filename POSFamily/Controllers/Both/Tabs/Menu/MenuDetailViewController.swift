//
//  MenuDetailViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class MenuDetailViewController: UIViewController {

    @IBOutlet var date: UILabel!
    
    var dateText = ""
    
    @IBOutlet var menuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        date.text = dateText
        
    }
    

    @IBAction func backButton1Pressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func backButton2Pressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func backButton3Pressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}
