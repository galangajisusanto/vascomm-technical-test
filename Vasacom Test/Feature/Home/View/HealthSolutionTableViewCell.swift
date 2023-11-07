//
//  HealthSolutionTableViewCell.swift
//  Vasacom Test
//
//  Created by MEKARI on 03/10/23.
//

import UIKit

class HealthSolutionTableViewCell: UITableViewCell {

    static let identifier = "HealthSolutionTableViewCell"
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCorner(cornerRadius: .small, shadow: .heavy)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
