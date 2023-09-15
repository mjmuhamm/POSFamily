//
//  FamilyViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class FamilyViewController: UIViewController {

    
    
    @IBOutlet var studentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         studentTableView.register(UINib(nibName: "StudentTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentTableViewReusableCell")
         studentTableView.delegate = self
         studentTableView.dataSource = self
        
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FamilySettings") as? AccountSettingsViewController  {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func notificationButtonPressed(_ sender: Any) {
    }
    
}

extension FamilyViewController :  UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewReusableCell", for: indexPath) as! StudentTableViewCell
       
        
        
        return cell
    }
    
}
