//
//  OrdersViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet var currentButton: UIButton!
    @IBOutlet var allButton: UIButton!
    
    @IBOutlet var ordersTableView: UITableView!
    
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersTableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewReusableCell")
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
        imageView.image = generateQRCode(name: "Malik Muhammad")
    }
    
    
    private func generateQRCode(name: String) -> UIImage? {
        let nameData = name.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(nameData, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    @IBAction func currentButtonPressed(_ sender: Any) {
        currentButton.backgroundColor = UIColor.systemFill
        allButton.backgroundColor = UIColor.clear
        ordersTableView.isHidden = true
        imageView.isHidden = false
        
        imageView.image = generateQRCode(name: "Malik Muhammad 2")
        
    }
    
    
    @IBAction func allButtonPressed(_ sender: Any) {
        currentButton.backgroundColor = UIColor.clear
        allButton.backgroundColor = UIColor.systemFill
        ordersTableView.isHidden = false
        imageView.isHidden = true
    }
    
    
    
    
}


extension OrdersViewController :  UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordersTableView.dequeueReusableCell(withIdentifier: "OrdersTableViewReusableCell", for: indexPath) as! OrdersTableViewCell
        
        cell.clickToReviewButtonTapped = {
            print("clicked")
        }
        
        return cell
    }
    
}
