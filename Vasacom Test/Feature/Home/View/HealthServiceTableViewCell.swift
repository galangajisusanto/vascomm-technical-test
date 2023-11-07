//
//  HealthServiceTableViewCell.swift
//  Vasacom Test
//
//  Created by MEKARI on 03/10/23.
//

import UIKit

class HealthServiceTableViewCell: UITableViewCell {
    
    static let identifier = "HealthServiceTableViewCell"

    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var healthService: HealthService? {
        didSet {
            nameLabel.text = healthService?.name
            buildingLabel.text = healthService?.building
            priceLabel.text = healthService?.price
            locationLabel.text = healthService?.location
            locationImage.image = UIImage(named: healthService?.image ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        locationImage.addCorner(cornerRadius: .large, shadow: .none)
        containerView.addCorner(cornerRadius: .large, shadow: .heavy)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
