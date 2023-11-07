//
//  CollectionView+Ext.swift
//  Vasacom Test
//
//  Created by MEKARI on 04/10/23.
//

import UIKit

extension UICollectionView {
    func registerCell<T>(_ cell: T.Type, identifier: String? = nil) where T: UICollectionViewCell {
        let nib = UINib(nibName: String(describing: cell.self), bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier == nil ? String(describing: cell.self) : identifier!)
    }
    
    func dequeueReusableCell<T>(_ cell: T.Type, indexPath: IndexPath, identifier: String? = nil) -> T where T: UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier == nil ? String(describing: cell.self) : identifier!, for: indexPath)
        guard let vcell = cell as? T else { fatalError("UITableView func dequeueReusableCell<T> failed") }
        return vcell
    }
}
