//
//  ProductCollectionViewCell.swift
//  Vasacom Test
//
//  Created by MEKARI on 03/10/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var readyStockView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var product: HealthProduct? {
        didSet {
            priceLabel.text = product?.price
            nameLabel.text = product?.name
            productImage.image = UIImage(named: product?.image ?? "")
            starLabel.text = "\(product?.star ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCorner(cornerRadius: .small, shadow: .little)
        readyStockView.addCorner(cornerRadius: .small, shadow: .none)
    }

}
