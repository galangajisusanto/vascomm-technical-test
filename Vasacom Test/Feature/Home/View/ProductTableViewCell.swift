//
//  ProductTableViewCell.swift
//  Vasacom Test
//
//  Created by MEKARI on 03/10/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productCollection: UICollectionView!
    
    var healthProducts: [HealthProduct] = [
        HealthProduct(id: 1, name: "Suntik Steril", price: "Rp. 10.000", star: 5, image: "product.png"),
        HealthProduct(id: 2, name: "Suntik Steril", price: "Rp. 50.000", star: 4, image: "product.png"),
        HealthProduct(id: 3, name: "Suntik Steril", price: "Rp. 10.000", star: 5, image: "product.png"),
        HealthProduct(id: 4, name: "Suntik Steril", price: "Rp. 50.000", star: 4, image: "product.png")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initCollection()
    }
    
    private func initCollection() {
        productCollection.dataSource = self
        productCollection.delegate = self
        productCollection.registerCell(ProductCollectionViewCell.self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ProductTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return healthProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ProductCollectionViewCell.self, indexPath: indexPath)
        cell.product = healthProducts[indexPath.row]
        return cell
    }
}

extension ProductTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 275, height: 300)
        
    }
}
