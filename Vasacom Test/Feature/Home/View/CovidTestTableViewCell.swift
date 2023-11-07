//
//  CovidTestTableViewCell.swift
//  Vasacom Test
//
//  Created by MEKARI on 03/10/23.
//

import UIKit

class CovidTestTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCorner(cornerRadius: .small, shadow: .little)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
