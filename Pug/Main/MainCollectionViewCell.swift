//
//  MainCollectionViewCell.swift
//  Pug
//
//  Created by Philip Starner on 1/25/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit
import SDWebImage

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageThumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageThumb.layer.cornerRadius = 6
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageThumb.image = nil
    }
    
    func loadModel(imageURL: String) {
        let url = URL(string: imageURL)
        self.imageThumb.sd_setImage(with: url)
    }
}
