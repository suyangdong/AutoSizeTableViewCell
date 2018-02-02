//
//  ViewController.swift
//  AutoSizeTableViewCell
//
//  Created by RippleArc on 11/30/17.
//  Copyright © 2017 RippleArc. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var listModel: ListModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(ListTableViewCell.self)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = .clear
        listModel = ListTableViewModel()
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ListTableViewCell
        if let model = listModel.cellModel(for: indexPath) {
            cell.configure(with: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.numberOfRows()
    }
    
}

