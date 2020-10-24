//
//  PictureCell.swift
//  CollectionViewAdvanceLayout
//
//  Created by Shantaram K on 24/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .random
    }

}
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
