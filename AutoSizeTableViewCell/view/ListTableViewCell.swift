//
//  ListTableViewCell.swift
//  AutoSizeTableViewCell
//
//  Created by RippleArc on 11/30/17.
//  Copyright © 2017 RippleArc. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    func configure(with model:ListTableViewCellModel) {
        categoryLabel.text = model.category.uppercased()
        titleLabel.text = model.title
        authorLabel.text = model.author
        timeLabel.text = model.timeStamp
        if let image = model.imageName {
            coverImage.isHidden = false
            coverImage.image = UIImage(named:image)
        } else {
            coverImage.isHidden = true
        }
    }
    
}

struct ListTableViewCellModel {
    var category: String
    var title: String
    var author: String
    var timeStamp: String
    var imageName: String?
    
    init(category: String, title: String, author: String,
         timeStamp: String, imageName: String?) {
        self.category = category
        self.title = title
        self.author = author
        self.timeStamp = timeStamp
        self.imageName = imageName
    }
}
