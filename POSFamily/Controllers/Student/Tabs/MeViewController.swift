//
//  MeViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet var paymentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        paymentView.layer.borderColor = UIColor.white.cgColor
        paymentView.layer.borderWidth = 1
        paymentView.layer.cornerRadius = 8
        
    }
    

    
}
