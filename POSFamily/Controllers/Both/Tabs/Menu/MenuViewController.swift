//
//  MenuViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var todayMenuView: UIView!
    
    @IBOutlet var todayButton: UIButton!
    @IBOutlet var monthButton: UIButton!
    
    @IBOutlet var monthCollectionView: UICollectionView!
    
    @IBOutlet var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        monthCollectionView.register(UINib(nibName: "MonthCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MonthCollectionViewReusableCell")
        monthCollectionView.delegate = self
        monthCollectionView.dataSource = self
    }
    

    @IBAction func todayButtonPressed(_ sender: Any) {
        todayButton.backgroundColor = UIColor.systemFill
        monthButton.backgroundColor = UIColor.clear
        
        todayMenuView.isHidden = false
        monthCollectionView.isHidden = true
        date.text = "September 01, 2023"
        
    }
    
    @IBAction func monthButtonPressed(_ sender: Any) {
        todayButton.backgroundColor = UIColor.clear
        monthButton.backgroundColor = UIColor.systemFill
        
        todayMenuView.isHidden = true
        monthCollectionView.isHidden = false
        
        date.text = "September"
    }
    
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCollectionView.dequeueReusableCell(withReuseIdentifier: "MonthCollectionViewReusableCell", for: indexPath) as! MonthCollectionViewCell
        
        var x = "\(indexPath.row + 1)"
        if Int(x)! < 10 {
            x = "0\(x)"
        }
        
        cell.date.text = "September \(x), 2023"
        
        cell.clickToViewButtonTapped = {
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuDetail") as? MenuDetailViewController  {
                vc.dateText = cell.date.text!
                self.present(vc, animated: true, completion: nil)
            }
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (monthCollectionView.frame.size.width / 4) - 4, height: (monthCollectionView.frame.size.height / 4) - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}


