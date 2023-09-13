//
//  OrdersTableViewCell.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/12/23.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet var typeOfMeal: UILabel!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemDate: UILabel!
    
    var clickToReviewButtonTapped : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func clickToReviewButtonPressed(_ sender: Any) {
        clickToReviewButtonTapped()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
