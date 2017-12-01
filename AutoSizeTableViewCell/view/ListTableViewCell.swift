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
    
    func configure(with model:ListTableViewCellModel) {
        categoryLabel.text = model.category.uppercased()
        titleLabel.text = model.title
        authorLabel.text = model.author
        timeLabel.text = model.timeStamp
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
