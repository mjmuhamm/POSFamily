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
        
    }
    
    @IBAction func monthButtonPressed(_ sender: Any) {
        todayButton.backgroundColor = UIColor.clear
        monthButton.backgroundColor = UIColor.systemFill
        
        todayMenuView.isHidden = true
        monthCollectionView.isHidden = false
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
            print("clicked \(cell.date.text)")
        }
        
//        if toggle == "main" {
//            cell.image.image = UIImage(named: "pic1")
//        } else {
//            cell.image.image = UIImage(named: "pic2")
//        }
//        cell.checkMark.isHidden = true
//
//        cell.imageButtonTapped = {
//            if cell.checkMark.isHidden == true {
//                cell.checkMark.isHidden = false
//            } else {
//                cell.checkMark.isHidden = true
//            }
//        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (monthCollectionView.frame.size.width / 3) - 3, height: (monthCollectionView.frame.size.height / 3) - 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}


