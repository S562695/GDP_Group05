//
//  CollectionDonorTableViewCell.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 11/30/23.
//

import UIKit

class CollectionDonorTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionDonorTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CollectionDonorTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
