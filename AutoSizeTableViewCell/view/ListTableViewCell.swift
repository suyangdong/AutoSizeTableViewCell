//
//  ListTableViewCell.swift
//  AutoSizeTableViewCell
//
//  Created by RippleArc on 11/30/17.
//  Copyright © 2017 RippleArc. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    func configure(with model:ListTableViewCellModel) {
        //TODO: Populate the UITableViewCell subviews with model
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
