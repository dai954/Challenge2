//
//  UIsearchBar.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit

extension UISearchBar {
    /// Return text field inside a search bar
    var textField: UITextField? {
        guard let text = self.value(forKey: "searchField") as? UITextField else {
            return nil
        }

        return text
    }
}
