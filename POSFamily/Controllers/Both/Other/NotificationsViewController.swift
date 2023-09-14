//
//  NotificationsViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/14/23.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet var notificationsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationsTableView.register(UINib(nibName: "NotificationsTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationsTableViewReusableCell")
        notificationsTableView.delegate = self
        notificationsTableView.dataSource = self
        
    }
    

    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}

extension NotificationsViewController :  UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationsTableView.dequeueReusableCell(withIdentifier: "NotificationsTableViewReusableCell", for: indexPath) as! NotificationsTableViewCell
        
        
        
        return cell
    }
    
}
