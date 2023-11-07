//
//  TableView+Ext.swift
//  Vasacom Test
//
//  Created by MEKARI on 03/10/23.
//

import UIKit

extension UITableView {
    func registerCell<T>(_ cell: T.Type) where T: UITableViewCell {
        let nib = UINib(nibName: String(describing: cell.self), bundle: nil)
        self.register(nib, forCellReuseIdentifier: String(describing: cell.self))
    }
    
    func dequeueCell<T>(_ cell: T.Type, indexPath: IndexPath) -> T where T: UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cell.self), for: indexPath)
        guard let vcell = cell as? T else { fatalError("UITableView func dequeueCell<T> failed") }
        return vcell
    }
}
