//
//  ListTableViewCell.swift
//  AutoSizeTableViewCell
//
//  Created by RippleArc on 11/30/17.
//  Copyright © 2017 RippleArc. All rights reserved.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {
    lazy private var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.green
        return label
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.lightGray
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    lazy private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.lightGray
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy private var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy private var dotView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    lazy private var mainContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy private var bodyContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    lazy private var footContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
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
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: String(describing: ListTableViewCell.self))
        buildView()
    }
    
    func buildView() {
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        contentView.addSubview(mainContainer)
        
        mainContainer.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().inset(20)
        }
        
        mainContainer.addArrangedSubview(categoryLabel)
        mainContainer.addArrangedSubview(bodyContainer)
        mainContainer.addArrangedSubview(footContainer)
        
        bodyContainer.addArrangedSubview(titleLabel)
        bodyContainer.addArrangedSubview(coverImage)
        
        coverImage.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.333)
            make.height.equalTo(bodyContainer.snp.width).multipliedBy(0.222)
        }
        
        footContainer.addArrangedSubview(authorLabel)
        footContainer.addArrangedSubview(dotView)
        footContainer.addArrangedSubview(timeLabel)
        
        dotView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 3.0, height: 3.0))
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
