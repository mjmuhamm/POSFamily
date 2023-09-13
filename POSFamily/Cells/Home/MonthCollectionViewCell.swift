//
//  MonthCollectionViewCell.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class MonthCollectionViewCell: UICollectionViewCell {

    @IBOutlet var date: UILabel!
    
    @IBOutlet var clickToView: UIButton!
    
    var clickToViewButtonTapped : (() -> ()) = {}
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func clickToViewButtonPressed(_ sender: Any) {
        clickToViewButtonTapped()
    }
    
}
