//
//  ListTableViewModel.swift
//  AutoSizeTableViewCell
//
//  Created by RippleArc on 12/1/17.
//  Copyright © 2017 RippleArc. All rights reserved.
//

import UIKit

protocol ListModel {
    func numberOfRows() -> Int
    func cellModel(for indexPath: IndexPath) -> ListTableViewCellModel?
}

struct ListTableViewModel: ListModel {
    func numberOfRows() -> Int {
        return 6
    }
    
    func cellModel(for indexPath: IndexPath) -> ListTableViewCellModel? {
        switch indexPath.row {
        case 0:
            return ListTableViewCellModel(category: "Bitcoin", title: "One bitcoin is now worth $10,000", author: "Fitz Tepper", timeStamp: "11 hours ago", imageName: "Bitcoin")
        case 1:
            return ListTableViewCellModel(category: "AUTOMOTIVE", title: "Expect GM Cruise self-driving vehicles to arrive in 'quarters, not year'", author: "Darrell Etherington", timeStamp: "1 hour ago", imageName: "GM")
        case 2:
            return ListTableViewCellModel(category: "AUTOMOTIVE", title: "Cruise's self-driving launch plan doesn't include small-scale pilots like Waymo's", author: "Darell Etherington", timeStamp: "1 hour ago", imageName: nil /*"Cruise"*/)
        case 3:
            return ListTableViewCellModel(category: "NIO", title: "Chinese electric vehicle maker NIO more concerned with user experience than rival Tesla", author: "Linda Lew", timeStamp: "3 hours ago", imageName: "NIO")
        case 4:
            return ListTableViewCellModel(category: "FINANCE", title: "Uber's losses grew to $1.5 billion last quarter", author: "Katie Roof", timeStamp: "5 hours ago", imageName: "Uber")
        case 5:
            return ListTableViewCellModel(category: "Microsoft", title: "Microsoft shows off Windows 'Sets', a tabbed app interface that puts a web browser everywhere", author: "Lucas Matney", timeStamp: "21 hours ago", imageName: "Microsoft")
        default:
            return nil
        }
    }
}


